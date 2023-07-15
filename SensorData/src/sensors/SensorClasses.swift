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
                self.updateSensorData()
            }
        }
    }
    
    override func stop() {
        self.motionManager.stopMagnetometerUpdates()
        self.x = 0
        self.y = 0
        self.z = 0
    }
    
    override func getSensorName()->String {
        return "Magnet Data"
    }
    
    override func sendToSensorData(){
        SensorData(magnet: self)
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
            }
        }
    }
    
    override func stop() {
        self.motionManager.stopAccelerometerUpdates()
        self.x = 0
        self.y = 0
        self.z = 0
    }
    
    override func getSensorName()->String {
        return "Accel Data"
    }
    
    override func sendToSensorData(){
        SensorData(accel: self)
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
        self.x = 0
        self.y = 0
        self.z = 0
    }
    
    override func getSensorName()->String {
        return "Gyro Data"
    }
    
    override func sendToSensorData(){
        SensorData(gyro: self)
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
//                self.updateSensorData()
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
//    var poster: FlaskClient? = nil

    @Published var x: Double = 0.0
    @Published var y: Double = 0.0
    @Published var z: Double = 0.0
    @Published var sensorDict: [String: Any] = [:]
    
    func start() {
        self.startUpdates()
    }

    func stop() {}
    func setUpdateInterval(sensorUpdateRate: Float16) {}
    func startUpdates() {}
    func getSensorName()->String { return "" }
    func updateSensorData(){
        self.sensorDict = ["name": self.getSensorName(), "data" : ["x": self.x, "y": self.y, "z": self.z]]
    }
    func sendToSensorData(){}
    
    init(sensorUpdateRate: Float16 = 0.10){
        self.motionManager = CMMotionManager()
        self.setUpdateInterval(sensorUpdateRate: sensorUpdateRate)
    }
}
