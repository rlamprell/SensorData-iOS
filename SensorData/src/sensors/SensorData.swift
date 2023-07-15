//
//  SensorData.swift
//  SensorData
//
//  Created by Rob Lamprell on 15/07/2023.
//

import Foundation

//class SensorDataType {
//    var x: Int
//    var y: Int
//    var z: Int
//
//    init(x: Int, y: Int, z: Int) {
//        self.x = x
//        self.y = y
//        self.z = z
//    }
//
//    func toDictionary() -> [String: Int] {
//        return ["x": x, "y": y, "z": z]
//    }
//}
//
//class Magnet: SensorDataType {
//    // Inherits x, y, z properties and toDictionary() method
//}
//
//class Accel: SensorDataType {
//    // Inherits x, y, z properties and toDictionary() method
//}
//
//class Gyro: SensorDataType {
//    // Inherits x, y, z properties and toDictionary() method
//}
//
//// if any of the toggles are on then collect the data
//class ToggleDetection {
//    var data: Dictionary<Any, Any>?
//
//    init(){
//
//    }
//
//}
//
//
//class SensorDataCollector {
//    var magnet: MagnetManager?
//    var accel: AccelerManager?
//    var gyro: GyroManager?
//
//    init(magnet: MagnetManager?, accel: AccelerManager?, gyro: GyroManager?) {
//        self.magnet = magnet
//        self.accel = accel
//        self.gyro = gyro
//    }
//
//    func toDictionary() -> [String: Any] {
//        var dictionary: [String: Any] = [:]
//
//        let mirror = Mirror(reflecting: self)
//        for child in mirror.children {
//            if let propertyName = child.label {
//                dictionary[propertyName] = child.value
//            }
//        }
//
//        return dictionary
//    }
//}

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
        else {
            let magnetData: [String: Any] = ["x": 0, "y": 0, "z": 0]
            sensorData["magnet"] = magnetData
        }

        if let accel = accel {
            let accelData: [String: Any] = ["x": accel.x, "y": accel.y, "z": accel.z]
            sensorData["accel"] = accelData
        }
        else {
            let accelData: [String: Any] = ["x": 0, "y": 0, "z": 0]
            sensorData["accel"] = accelData
        }

        if let gyro = gyro {
            let gyroData: [String: Any] = ["x": gyro.x, "y": gyro.y, "z": gyro.z]
            sensorData["gyro"] = gyroData
        }
        else {
            let gyroData: [String: Any] = ["x": 0, "y": 0, "z": 0]
            sensorData["gyro"] = gyroData
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

//class SensorData {
//    var magnet: Bool
//    var accel: Bool
//    var gyro: Bool
//
//    func updateSensorData() -> [String: [String: Any]] {
//        var sensorData: [String: [String: Any]] = [:]
//
//        if let magnet = magnet {
//            let magnetData: [String: Any] = ["x": magnet.x, "y": magnet.y, "z": magnet.z]
//            sensorData["magnet"] = magnetData
//        }
//
//        if let accel = accel {
//            let accelData: [String: Any] = ["x": accel.x, "y": accel.y, "z": accel.z]
//            sensorData["accel"] = accelData
//        }
//
//        if let gyro = gyro {
//            let gyroData: [String: Any] = ["x": gyro.x, "y": gyro.y, "z": gyro.z]
//            sensorData["gyro"] = gyroData
//        }
//
//        return sensorData
//    }
//
//    init(magnet:Bool = false, accel:Bool = false, gyro:Bool = false) {
//        self.magnet = magnet
//        self.accel = accel
//        self.gyro = gyro
//    }
//}



class FlaskSend {
    var poster: FlaskClient? = nil
    
    func sendUpdate(data: [String: [String: Any]]){
        self.poster?.sendSensorData(sensorData: data)
    }
    
    init(poster: FlaskClient? = nil) {
        if poster==nil {
            self.poster = FlaskClient(serverUrl: URL(string:"http://192.168.0.12:3000/example")!)
        }
    }
}
