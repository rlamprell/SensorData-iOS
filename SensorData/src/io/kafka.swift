//
//  kafka.swift
//  SensorData
//
//  Created by Rob Lamprell on 17/07/2023.
//


import Foundation

class KafkaRestProxy {
    let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func sendMessage(topic: String, message: String) {
        let url = URL(string: "\(baseUrl)/topics/\(topic)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/vnd.kafka.json.v2+json", forHTTPHeaderField: "Content-Type")

        let messageData = [
            "records": [
                ["value": message]
            ]
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: messageData)
        } catch {
            print("Failed to serialize message data: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending message to Kafka: \(error)")
            } else {
                print("Message sent successfully to Kafka")
            }
        }.resume()
    }
}

