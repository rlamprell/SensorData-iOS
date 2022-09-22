//
//  ContentView.swift
//  SensorData
//
//  Created by Rob Lamprell on 20/09/2022.
//


import SwiftUI
import Combine
import CoreMotion

struct ContentView: View {
    
    @ObservedObject var motion: MotionManager
    // You need to instanciate your MotionManager class as an ObservedObject to use x, y and z when the update
    
    var body: some View {
        
        HStack {
            Button("Start") {
                motion.start()
            } .padding()
            
            Button("Stop") {
                motion.stop()
            } .padding()
        }
        
        VStack {
            Text("Magnetometer Data")
            Text("X: \(motion.x)")
            Text("Y: \(motion.y)")
            Text("Z: \(motion.z)")
        }
    }
}



class MagnetManager: MotionManager {
    override func start() {
        motionManager.startMagnetometerUpdates(to: .main) { (data, error) in
            guard error == nil else {
                print(error!)
                return
            }

            self.addData(input: data)
            self.addData0(input: data)
//            self.addData0(input: data, property: \.magneticField.x)
        }
    }
    
    
    override func stop() {
        motionManager.stopMagnetometerUpdates()
    }
    
    
    override init() {
        super.init()
        self.motionManager.magnetometerUpdateInterval = 0.5
        self.motionManager.startMagnetometerUpdates(to: .main) { (data, error) in
            guard error == nil else {
                print(error!)
                return
            }
            self.addData(input: data)
//            self.addData0(input: data, property: \.magneticField.x)
            self.addData0(input: data)
        }
    }
    
    
    func addData(input: Optional<CMMagnetometerData>) {
        if let data = input {
//            print(type(of: data.magneticField))
            self.x = data.magneticField.x
            self.y = data.magneticField.y
            self.z = data.magneticField.z
        }
    }
    
    func addData0(input: Optional<CMMagnetometerData>) {
        if let data = input {
//            return
//            data.perform(NSSelectorFromString("magneticField"))
//            let mags = data.value(forKey: "magneticField")
//            print(type(of: mags))
            let thispath = "\\.magneticField.x"
            print(thispath)
//            print(data[keyPath: T])
            self.addSingleDP(input: data, property: \.magneticField.x)
//            addSingleDP(input: data, property: \.magneticField.y)
//            addSingleDP(input: data, property: \.magneticField.z)
        }
    }
    
//    func addData0<T: CustomStringConvertible>(input: Optional<CMMagnetometerData>, property: KeyPath<CMMagnetometerData, T>) {
//        if let data = input {
////            print(type(of: data.magneticField))
//            self.x = data.magneticField.x
////            print(data.valueForKey: "magneticField")
////            print(data[keyPath: <#T##KeyPath<CMMagnetometerData, Value>#>])
//            print(data[keyPath: property])
//            print(data.magneticField)
////            print(type(of: data))
//        }
//    }
    
    func addSingleDP<T: CustomStringConvertible>(input: CMMagnetometerData, property: KeyPath<CMMagnetometerData, T>) {
        print(input[keyPath: property])
        
    }
    
    
    func initialise_updates() {
        motionManager.startMagnetometerUpdates(to: .main) { (data, error) in
            guard error == nil else {
                print(error!)
                return
            }

            self.addData(input: data)
        }
    }
}


class Accelermanager: MotionManager {
    override func start() {
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
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
        motionManager.stopMagnetometerUpdates()
    }
    
    override init() {
        super.init()
        self.motionManager.accelerometerUpdateInterval = 0.5
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
}



class MotionManager: ObservableObject {
    // MotionManager use the ObservableObject Combine property.
    var motionManager: CMMotionManager
    
    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    // x, y and z use are Published so ContentView can read the values when they update.
    var motionType = ""
    
    
    func start() {}
    func stop() {}
    func setType() {}
    
    
    // init
    init() {
        self.motionManager = CMMotionManager()
    }
}
//
//
//class MotionManager: ObservableObject {
//    // MotionManager use the ObservableObject Combine property.
//    private var motionManager: CMMotionManager
//
//    @Published
//    var x: Double = 0.0
//    @Published
//    var y: Double = 0.0
//    @Published
//    var z: Double = 0.0
//    // x, y and z use are Published so ContentView can read the values when they update.
//
//
//    func start() {
//        motionManager.startMagnetometerUpdates(to: .main) { (data, error) in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//
//            if let data = data {
//                self.x = data.magneticField.x
//                self.y = data.magneticField.y
//                self.z = data.magneticField.z
//            }
//
//        }
//    }
//
//
//    func stop() {
//        motionManager.stopMagnetometerUpdates()
//    }
//
//
//    // init
//    init() {
//        self.motionManager = CMMotionManager()
//        self.motionManager.magnetometerUpdateInterval = 0.5
//        self.motionManager.startMagnetometerUpdates(to: .main) { (data, error) in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//
//            if let data = data {
//                self.x = data.magneticField.x
//                self.y = data.magneticField.y
//                self.z = data.magneticField.z
//            }
//        }
//    }
//}


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
//
//
//class MotionManager: ObservableObject {
//    // MotionManager use the ObservableObject Combine property.
//    private var motionManager: CMMotionManager
//
//    @Published
//    var x: Double = 0.0
//    @Published
//    var y: Double = 0.0
//    @Published
//    var z: Double = 0.0
//    // x, y and z use are Published so ContentView can read the values when they update.
//
//    func start() {
//        motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//
//            if let magnetData = magnetometerData {
//                self.x = magnetData.magneticField.x
//                self.y = magnetData.magneticField.y
//                self.z = magnetData.magneticField.z
//            }
//
//        }
//    }
//
//    func stop() {
//        motionManager.stopMagnetometerUpdates()
//    }
//
//    // init
//    init() {
//        self.motionManager = CMMotionManager()
//        self.motionManager.magnetometerUpdateInterval = 0.5
//        self.motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//
//            if let magnetData = magnetometerData {
//                self.x = magnetData.magneticField.x
//                self.y = magnetData.magneticField.y
//                self.z = magnetData.magneticField.z
//            }
//
//        }
//
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(motion: MotionManager())
    }
}

//import SwiftUI
//import CoreMotion
//
//struct ContentView: View {
//
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
////        ViewControllerMy()
//    }
//
//
//}
//
////struct ViewControllerMy: UIViewController {
////    let manager = CMMotionManager()
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        manager.startAccelerometerUpdates()
////
////        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
////            if let data = self.manager.accelerometerData {
////                let x = data.acceleration.x
////                let y = data.acceleration.y
////                let z = data.acceleration.z
////                print(x)
////            }
////
////
////        }
////
////    }
////}
//
//class sensorData {
//    func enableSensor() {}
//    func getData(){}
//}
//
//
//class AccelerometerData: sensorData {
//    @State private var enabled = false
//
//    let motionManager           = CMMotionManager()
//    let queue                   = OperationQueue()
//
//    let number = 12
//
//
//    var pitch    = Double.zero
//    @State private var yaw      = Double.zero
//    @State private var roll     = Double.zero
//
//    override func enableSensor() {
//        enabled = true
//    }
//
//    override func getData(){
////        VStack{
////            Text("Pitch: \(self.pitch)")
////            Text("Yaw: \(self.yaw)")
////            Text("Roll: \(self.roll)")
////        }//Vstack
////        .onAppear() {
//
//        motionManager.startDeviceMotionUpdates(to: self.queue) {
//            (data: CMDeviceMotion?, error: Error?) in
//            guard let data = data else {
//                print("Error: \(error!)")
//                return
//            }
//
////            let data = CMDeviceMotion()
//            let attitude: CMAttitude = data.attitude
////            print("pitch: \(attitude.pitch)")
////            print("yaw: \(attitude.yaw)")
////            print("roll: \(attitude.roll)")
////            print("hi")
//
////            DispatchQueue.main.async {
////                pitch  = attitude.pitch
////                yaw    = attitude.yaw
////                roll   = attitude.roll
////            }
////            DispatchQueue.main.async {
////                self.pitch  = attitude.pitch
////                self.yaw    = attitude.yaw
////                self.roll   = attitude.roll
////            }
////            }
////            print("inside getData")
//            self.pitch = 0.11
//
////            return [attitude.pitch, attitude.yaw, attitude.roll]
//
////            self.pitch = 0.11
////            print(self.pitch)
////            self.yaw = attitude.yaw
////            self.roll = attitude.roll
//        }
//
//    }
//
//    func getPitch()->Double {
//        print("returning pitch")
//        print(pitch)
//        return self.pitch
//    }
//
//    func getYaw()->Double {
//        return self.yaw
//    }
//
//    func getRoll()->Double {
//        return self.roll
//    }
//}
//
//
//struct mainViewerView: View {
//
//
//    @State private var pee = Double.zero
//    @State private var yaw = Double.zero
//    @State private var roll = Double.zero
//    var body: some View {
//
////        var pitch = Double.zero
////        var yaw = Double.zero
////        var roll = Double.zero
//
//
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            //        if let data = self.manager.accelerometerData {
//            //            let x = data.acceleration.x
//            //            let y = data.acceleration.y
//            //            let z = data.acceleration.z
//            //        }
//            VStack{
//                Text("Pitch: \(pee)")
//                Text("Yaw: \(yaw)")
//                Text("Roll: \(roll)")
//            }//Vstack
//            .onAppear() {
//                let acc = AccelerometerData()
//                acc.getData()
//                DispatchQueue.main.async {
//                    self.pee = acc.getPitch()
//                    self.yaw = acc.getYaw()
//                    self.roll = acc.getRoll()
//                }
//                //            self.pitch = acc.getPitch()
//                //            self.yaw = acc.getYaw()
//                //            self.roll = acc.getRoll()
//                print("hi there")
//            }
//        }
//    }
//}
//
//
//
//struct AccelerometerView: View {
//
//    let motionManager = CMMotionManager()
//    let queue = OperationQueue()
//
//    @State private var pitch = Double.zero
//    @State private var yaw = Double.zero
//    @State private var roll = Double.zero
//
//    var body: some View {
//
//        VStack{
//            Text("Pitch: \(pitch)")
//            Text("Yaw: \(yaw)")
//            Text("Roll: \(roll)")
//        }//Vstack
//        .onAppear {
////            print("ON APPEAR")
//            self.motionManager.startDeviceMotionUpdates(to: self.queue) {
//                (data: CMDeviceMotion?, error: Error?) in
//                guard let data = data else {
//                    print("Error: \(error!)")
//                    return
//                }
//                let attitude: CMAttitude = data.attitude
//
////                print("pitch: \(attitude.pitch)")
////                print("yaw: \(attitude.yaw)")
////                print("roll: \(attitude.roll)")
//
//                DispatchQueue.main.async {
//                    self.pitch = attitude.pitch
//                    self.yaw = attitude.yaw
//                    self.roll = attitude.roll
//                }
//            }
//        }//.onappear
//    }//view
//}//struct


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        //        ContentView()
//        AccelerometerView()
//    }
//}

