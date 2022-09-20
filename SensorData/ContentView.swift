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

struct myStruct {
    func dosomething() -> Int {
        return 1
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
                print("ON APPEAR")
                self.motionManager.startDeviceMotionUpdates(to: self.queue) { (data: CMDeviceMotion?, error: Error?) in
                    guard let data = data else {
                        print("Error: \(error!)")
                        return
                    }
                    let attitude: CMAttitude = data.attitude

                    print("pitch: \(attitude.pitch)")
                    print("yaw: \(attitude.yaw)")
                    print("roll: \(attitude.roll)")

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
