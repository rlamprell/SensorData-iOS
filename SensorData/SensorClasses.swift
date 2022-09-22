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
    override func setUpdateInterval() {
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
    
    
    override func getSensorName()->String {
        return "Magnet Data"
    }
}



class AccelerManager: MotionManager {
    override func setUpdateInterval() {
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
    
    
    override func getSensorName()->String {
        return "Accel Data"
    }
}




class GyroManager: MotionManager {
    override func setUpdateInterval() {
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
    
    
    override func getSensorName()->String {
        return "Gyro Data"
    }
}




class MotionManager: ObservableObject {
    // MotionManager use the ObservableObject Combine property.
    var motionManager: CMMotionManager
    
    @Published var x: Double = 0.0
    @Published var y: Double = 0.0
    @Published var z: Double = 0.0
    
    func start() {
        self.startUpdates()
    }

    func stop() {
        motionManager.stopMagnetometerUpdates()
    }
    
    func setUpdateInterval() {}
    func startUpdates() {}
    func getSensorName()->String { return "" }
    
    init() {
        self.motionManager = CMMotionManager()
        self.setUpdateInterval()
        self.startUpdates()
    }
}


class MagnetMotionManager: ObservableObject {
    // MotionManager use the ObservableObject Combine property.
    private var motionManager: CMMotionManager
    
    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    // x, y and z use are Published so ContentView can read the values when they update.
    
    func start() {
        motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let magnetData = magnetometerData {
                self.x = magnetData.magneticField.x
                self.y = magnetData.magneticField.y
                self.z = magnetData.magneticField.z
            }
            
        }
    }
    
    func stop() {
        motionManager.stopMagnetometerUpdates()
    }
    
    // init
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.magnetometerUpdateInterval = 0.5
        self.motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let magnetData = magnetometerData {
                self.x = magnetData.magneticField.x
                self.y = magnetData.magneticField.y
                self.z = magnetData.magneticField.z
            }
            
        }
        
    }
}
