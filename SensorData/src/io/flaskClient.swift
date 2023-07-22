//
//  flask_client.swift
//  SensorData
//
//  Created by Rob Lamprell on 14/04/2023.
//

import Foundation


class FlaskClient {
    let session: URLSession
    let serverUrl: URL
    
    init(serverUrl: URL) {
        self.serverUrl = serverUrl
        self.session = URLSession(configuration: .default)
    }
    
    func sendSensorData(sensorData: [AnyHashable: Any]) {
        if let jsonData = try? JSONSerialization.data(withJSONObject: sensorData, options: []) {
            var request = URLRequest(url: serverUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = session.dataTask(with: request) { (data, response, error) in
                // Handle the server response here
                print(response as Any)
                print(data as Any)
                print(error as Any)
            }
            task.resume()
        }
    }
}
