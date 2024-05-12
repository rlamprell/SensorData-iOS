//
//  ConnectionSettings.swift
//  SensorData
//
//  Created by Rob Lamprell on 25/07/2023.
//

import Foundation


class ConnectionSettings: ObservableObject {
    @Published var ipAddress: String = "" {
        didSet {
            validateIPAddress()
        }
    }
    
    @Published var portNumber: String = "" {
        didSet {
            validatePortNumber()
        }
    }
    
    private func validateIPAddress() {
        // Add your validation logic for the IP address here
        // For example, you can check if the IP address format is valid
        // and display an error message if it's not.
        print("IP address updated: \(ipAddress)")
    }
    
    private func validatePortNumber() {
        // Add your validation logic for the port number here
        // For example, you can use the regex function as shown in the previous response.
        let pattern = #"^\d+\.\d+\.\d+\.\d+$"#
        print(portNumber)
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(location: 0, length: portNumber.utf16.count)
            let isValid = regex.firstMatch(in: portNumber, options: [], range: range) != nil
            if isValid {
                // Perform any action or show an error message if the format is invalid
//                print("Invalid port number format.")
                print("Port number updated: \(portNumber)")
            }
        }
        catch {
            print("Invalid regex pattern: \(error)")
        }
//        if portNumber=="1"{
//            print("Port number updated: \(portNumber)")
//        }
//        else{
//            print("no")
//        }
    }
}
