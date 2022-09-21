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
            ContentView(motion: thismotion)
            ContentView(motion: thismotion)
            ContentView(motion: thismotion)
            ContentView(motion: thismotion)
//            AccelerometerView()
//            mainViewerView()
        }
    }
}
