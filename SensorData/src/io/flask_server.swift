//
//  flask_server.swift
//  SensorData
//
//  Created by Rob Lamprell on 14/04/2023.
//

//import Foundation
//
//struct FlaskClient1 {
//    func postRequest(url: String, body: [String: Any], completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
//        let session = URLSession.shared
//        let url = URL(string: url)!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.httpBody = try! JSONSerialization.data(withJSONObject: body, options: [])
//
//        let task = session.dataTask(with: request, completionHandler: completion)
//        task.resume()
//    }
//}
