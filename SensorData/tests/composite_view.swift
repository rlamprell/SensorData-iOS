//
//  composite_view.swift
//  SensorData
//
//  Created by Rob Lamprell on 15/10/2022.
//
import SwiftUI
struct composite_view: View {
    var body: some View {
        ViewController()
        let maggy = MagnetManager()
        let acc = AccelerManager()
        let gyro = GyroManager()
        let motion = DeviceMotion()
        ContentView(motion: maggy)
        ContentView(motion: acc)
        ContentView(motion: gyro)
        ContentView(motion: motion)
        
        
    }
}
