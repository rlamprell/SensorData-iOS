//
//  SensorView.swift
//  SensorData
//
//  Created by Rob Lamprell on 18/10/2022.
//

import SwiftUI

struct SensorView: View {
    var body: some View {
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

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        SensorView()
    }
}
