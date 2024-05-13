//
//  flask_client.swift
//  SensorData
//
//  Created by Rob Lamprell on 14/04/2023.
//

import Foundation
import SwiftUI
import Combine

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



class FlaskSend {
    var poster: FlaskClient? = nil
    private var cancellable: AnyCancellable?
    
    init(connectionSettings: ConnectionSettings) {
        // Initialize with current network config
        var port = connectionSettings.portNumber
        var ipAddress = connectionSettings.ipAddress
        var url = URL(string: "http://\(ipAddress):\(port)/insert_data")!
        self.poster = FlaskClient(serverUrl: url)
        
        // Subscribe to updates
        self.cancellable = connectionSettings.$ipAddress.combineLatest(connectionSettings.$portNumber)
            .sink { [weak self] ipAddress, portNumber in
                guard let self = self else { return }
                let newUrl = URL(string: "http://\(ipAddress):\(portNumber)/insert_data")!
                self.poster = FlaskClient(serverUrl: newUrl)
            }
    }
    
    func sendUpdate(data: [String: [String: Any]]) {
        self.poster?.sendSensorData(sensorData: data)
    }
}
