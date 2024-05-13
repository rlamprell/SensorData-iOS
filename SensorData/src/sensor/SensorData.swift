//
//  SensorData.swift
//  SensorData
//
//  Created by Rob Lamprell on 15/07/2023.
//

import Foundation


class SensorData {
    var magnet: MagnetManager?
    var accel: AccelerManager?
    var gyro: GyroManager?

    func updateSensorData(isMagOn: Bool, isAccOn: Bool, isGyrOn: Bool) -> [String: [String: Any]] {
        var sensorData: [String: [String: Any]] = [:]
        
        if let magnet = magnet {
            let magnetData: [String: Any] = ["x": magnet.x, "y": magnet.y, "z": magnet.z]
            sensorData["magnet"] = magnetData
        }
//        else {
//            let magnetData: [String: Any] = ["x": 0, "y": 0, "z": 0]
//            sensorData["magnet"] = magnetData
//        }

        if let accel = accel {
            let accelData: [String: Any] = ["x": accel.x, "y": accel.y, "z": accel.z]
            sensorData["accel"] = accelData
        }
//        else {
//            let accelData: [String: Any] = ["x": 0, "y": 0, "z": 0]
//            sensorData["accel"] = accelData
//        }

        if let gyro = gyro {
            let gyroData: [String: Any] = ["x": gyro.x, "y": gyro.y, "z": gyro.z]
            sensorData["gyro"] = gyroData
        }
//        else {
//            let gyroData: [String: Any] = ["x": 0, "y": 0, "z": 0]
//            sensorData["gyro"] = gyroData
//        }
        if !sensorData.isEmpty {
            var executionDetails: [String: Any] = [:]

            // Add timestamp (now)
            let timestamp = Int(Date().timeIntervalSince1970) // Unix timestamp in seconds
            executionDetails["timestamp"] = timestamp

            // Add execution ID (assuming you have an executionID variable)
            let executionID = "your_execution_id_here"
            executionDetails["execution_id"] = executionID

            // Add exercise type (assuming you have an exerciseType variable)
            let exerciseType = "your_exercise_type_here"
            executionDetails["exercise_type"] = exerciseType

            sensorData["execution_details"] = executionDetails
        }
        
        
        print(sensorData)
        return sensorData
    }

    init(magnet: MagnetManager? = nil, accel: AccelerManager? = nil, gyro: GyroManager? = nil) {
        self.magnet = magnet
        self.accel = accel
        self.gyro = gyro
    }
}



class FlaskSend {
    var poster: FlaskClient? = nil
    
    func sendUpdate(data: [String: [String: Any]]){
        self.poster?.sendSensorData(sensorData: data)
    }
    
    init(poster: FlaskClient? = nil) {
        if poster==nil {
            self.poster = FlaskClient(serverUrl: URL(string:"http://192.168.137.199:3000/insert_data")!)
//            self.poster = FlaskClient(serverUrl: URL(string:"http://192.168.0.12:3000/example")!)
//            self.poster = FlaskClient(serverUrl: URL(string:"http://172.20.0.1:3000/example")!)
//            self.poster = FlaskClient(serverUrl: URL(string:"http://127.0.0.1:3000/example")!)
        }
    }
}

