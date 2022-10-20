//
//  SensorDataApp.swift
//  SensorData
//
//  Created by Rob Lamprell on 20/09/2022.
//

import SwiftUI

// observable
class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    
    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}

@main
struct SensorDataApp: App {
    @ObservedObject var appState = AppState(hasOnboarded: false)
    
    var body: some Scene {
        WindowGroup {
//            OnBoardingFlowView().environmentObject(appState)
//            MainFlowView().environmentObject(appState)
//            ViewController()
//            let thismotion = MotionManager()
//            ViewController()
//            let maggy = MagnetManager()
//            let acc = AccelerManager()
//            let gyro = GyroManager()
//            let motion = DeviceMotion()
//            ContentView(motion: maggy)
//            ContentView(motion: acc)
//            ContentView(motion: gyro)
//            composite_view()
//            ContentView(motion: motion)
//            StoryBoardView()
//            AccelerometerView()
//            mainViewerView()
            newName()
        }
    }
}
