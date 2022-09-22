//
//  SensorDataApp.swift
//  SensorData
//
//  Created by Rob Lamprell on 20/09/2022.
//

import SwiftUI

@main
struct SensorDataApp: App {
    var body: some Scene {
        WindowGroup {
            let thismotion = MotionManager()
            let maggy = MagnetManager()
            let acc = AccelerManager()
            let gyro = GyroManager()
            ContentView(motion: maggy)
            ContentView(motion: acc)
            ContentView(motion: gyro)
            ContentView(motion: thismotion)
//            AccelerometerView()
//            mainViewerView()
        }
    }
}
