//
//  SensorClasses.swift
//  SensorData
//
//  Created by Rob Lamprell on 22/09/2022.
//

import Foundation
import Combine
import CoreMotion


class MagnetManager: MotionManager {
    override func setUpdateInterval(sensorUpdateRate: Float16) {
        self.motionManager.magnetometerUpdateInterval = 0.5
    }
    
    override func startUpdates() {
        self.motionManager.startMagnetometerUpdates(to: .main) { (data, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if let data = data {
                self.x = data.magneticField.x
                self.y = data.magneticField.y
                self.z = data.magneticField.z
                let p: () = self.updateSensorData()
                print(p)
                let _ = print("hi!")
                NSLog("Can anyone hear me?")
                self.sendUpdate()
            }
        }
    }
    
    override func stop() {
        self.motionManager.stopMagnetometerUpdates()
    }
    
    override func getSensorName()->String {
        return "Magnet Data"
    }
}



class AccelerManager: MotionManager {
    override func setUpdateInterval(sensorUpdateRate: Float16) {
        self.motionManager.accelerometerUpdateInterval = 0.5
    }
    
    override func startUpdates() {
        self.motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if let data = data {
                self.x = data.acceleration.x
                self.y = data.acceleration.y
                self.z = data.acceleration.z
                self.updateSensorData()
                let p: () = self.updateSensorData()
                print(p)
                let _ = print("hi!")
                NSLog("Can anyone hear me?")
                self.sendUpdate()
            }
        }
    }
    
    override func stop() {
        self.motionManager.stopAccelerometerUpdates()
    }
    
    override func getSensorName()->String {
        return "Accel Data"
    }
}




class GyroManager: MotionManager {
    override func setUpdateInterval(sensorUpdateRate: Float16) {
        self.motionManager.gyroUpdateInterval = 0.5
    }
    
    override func startUpdates() {
        self.motionManager.startGyroUpdates(to: .main) { (data, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if let data = data {
                self.x = data.rotationRate.x
                self.y = data.rotationRate.y
                self.z = data.rotationRate.z
                self.updateSensorData()
            }
        }
    }
    
    override func stop() {
        self.motionManager.stopGyroUpdates()
    }
    
    override func getSensorName()->String {
        return "Gyro Data"
    }
}




class DeviceMotion: MotionManager {
    override func setUpdateInterval(sensorUpdateRate: Float16) {
        self.motionManager.deviceMotionUpdateInterval = 0.5
    }
    
    override func startUpdates() {
        self.motionManager.startDeviceMotionUpdates(to: .main) { (data, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if let data = data {
                self.x = data.rotationRate.x
                self.y = data.rotationRate.y
                self.z = data.rotationRate.z
                self.updateSensorData()
            }
        }
    }
    
    override func stop() {
        self.motionManager.stopDeviceMotionUpdates()
    }
    
    override func getSensorName()->String {
        return "Device Motion Data"
    }
}




class MotionManager: ObservableObject {
    let motionManager: CMMotionManager
    var poster: FlaskClient? = nil

    @Published var x: Double = 0.0
    @Published var y: Double = 0.0
    @Published var z: Double = 0.0
    @Published var sensorDict: Dictionary = [:]
    
    func start() {
        self.startUpdates()
    }

    func stop() {}
    func setUpdateInterval(sensorUpdateRate: Float16) {}
    func startUpdates() {}
    func getSensorName()->String { return "" }
    func updateSensorData(){
        self.sensorDict = ["name": self.getSensorName(), "x": self.x, "y": self.y, "z": self.z]
    }
    func getSensorData()->[String: Double] {
        return ["x": self.x, "y": self.y, "z": self.z]
    }
    func sendUpdate(){
        self.poster?.sendSensorData(sensorData: self.sensorDict)
    }
    
    init(sensorUpdateRate: Float16 = 0.10, poster: FlaskClient? = nil) {
        if poster==nil {
            self.poster = FlaskClient(serverUrl: URL(string:"http://192.168.0.12:3000/example")!)
        }
        self.motionManager = CMMotionManager()
        self.setUpdateInterval(sensorUpdateRate: sensorUpdateRate)
    }
}
