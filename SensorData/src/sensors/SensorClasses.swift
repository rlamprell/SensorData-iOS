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

    @Published var x: Double = 0.0
    @Published var y: Double = 0.0
    @Published var z: Double = 0.0
    
    func start() {
        self.startUpdates()
    }

    func stop() {}
    func setUpdateInterval(sensorUpdateRate: Float16) {}
    func startUpdates() {}
    func getSensorName()->String { return "" }
    
    init(sensorUpdateRate: Float16 = 0.10) {
        self.motionManager = CMMotionManager()
        self.setUpdateInterval(sensorUpdateRate: sensorUpdateRate)
    }
}
