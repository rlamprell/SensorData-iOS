//
//  ContentView.swift
//  SensorData
//
//  Created by Rob Lamprell on 20/09/2022.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    var body: some View {
        Text("Hello, world!")
            .padding()
//        ViewControllerMy()
    }
    
    
}

//struct ViewControllerMy: UIViewController {
//    let manager = CMMotionManager()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        manager.startAccelerometerUpdates()
//
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            if let data = self.manager.accelerometerData {
//                let x = data.acceleration.x
//                let y = data.acceleration.y
//                let z = data.acceleration.z
//                print(x)
//            }
//
//
//        }
//
//    }
//}

class sensorData {
    func enableSensor() {}
    func getData()->Array<Double>{}
}


class AccelerometerData: sensorData {
    @State private var enabled = false
    
    let motionManager           = CMMotionManager()
    let queue                   = OperationQueue()
    
    let number = 12
    
    
    var pitch    = Double.zero
    @State private var yaw      = Double.zero
    @State private var roll     = Double.zero
    
    override func enableSensor() {
        enabled = true
    }
    
    override func getData()->Array<Double>{
//        VStack{
//            Text("Pitch: \(self.pitch)")
//            Text("Yaw: \(self.yaw)")
//            Text("Roll: \(self.roll)")
//        }//Vstack
//        .onAppear() {
        
        self.motionManager.startDeviceMotionUpdates(to: self.queue) {
            (data: CMDeviceMotion?, error: Error?) in
            guard let data = data else {
                print("Error: \(error!)")
                
            }
            
//            let data = CMDeviceMotion()
            let attitude: CMAttitude = data.attitude
//            print("pitch: \(attitude.pitch)")
//            print("yaw: \(attitude.yaw)")
//            print("roll: \(attitude.roll)")
//            print("hi")
            
//            DispatchQueue.main.async {
//                pitch  = attitude.pitch
//                yaw    = attitude.yaw
//                roll   = attitude.roll
//            }
//            DispatchQueue.main.async {
//                self.pitch  = attitude.pitch
//                self.yaw    = attitude.yaw
//                self.roll   = attitude.roll
//            }
//            }
            return [attitude.pitch, attitude.yaw, attitude.roll]
            
//            self.pitch = 0.11
//            print(self.pitch)
//            self.yaw = attitude.yaw
//            self.roll = attitude.roll
        }
        
    }
    
    func getPitch()->Double {
        print("returning pitch")
        print(pitch)
        return self.pitch
    }
    
    func getYaw()->Double {
        return self.yaw
    }
    
    func getRoll()->Double {
        return self.roll
    }
}


struct mainViewerView: View {

    
    @State private var pee = Double.zero
    @State private var yaw = Double.zero
    @State private var roll = Double.zero
    var body: some View {
        
//        var pitch = Double.zero
//        var yaw = Double.zero
//        var roll = Double.zero
        
        
        
        VStack{
            Text("Pitch: \(pee)")
            Text("Yaw: \(yaw)")
            Text("Roll: \(roll)")
        }//Vstack
        .onAppear() {
            let acc = AccelerometerData()
            acc.getData()
            DispatchQueue.main.async {
                self.pee = acc.getPitch()
                self.yaw = acc.getYaw()
                self.roll = acc.getRoll()
            }
//            self.pitch = acc.getPitch()
//            self.yaw = acc.getYaw()
//            self.roll = acc.getRoll()
            print("hi there")
        }
    }
}


    
struct AccelerometerView: View {
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    @State private var pitch = Double.zero
    @State private var yaw = Double.zero
    @State private var roll = Double.zero
    
    var body: some View {
        
        VStack{
            Text("Pitch: \(pitch)")
            Text("Yaw: \(yaw)")
            Text("Roll: \(roll)")
        }//Vstack
        .onAppear {
//            print("ON APPEAR")
            self.motionManager.startDeviceMotionUpdates(to: self.queue) {
                (data: CMDeviceMotion?, error: Error?) in
                guard let data = data else {
                    print("Error: \(error!)")
                    return
                }
                let attitude: CMAttitude = data.attitude
                
//                print("pitch: \(attitude.pitch)")
//                print("yaw: \(attitude.yaw)")
//                print("roll: \(attitude.roll)")
                
                DispatchQueue.main.async {
                    self.pitch = attitude.pitch
                    self.yaw = attitude.yaw
                    self.roll = attitude.roll
                }
            }
        }//.onappear
    }//view
}//struct


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        ContentView()
        AccelerometerView()
    }
}

