//
//  ContentView.swift
//  SensorData
//
//  Created by Rob Lamprell on 20/09/2022.
//


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var motion: MotionManager
    @State private var turnOn = false

    
    var body: some View {
        
        HStack {
            Toggle(motion.getSensorName(), isOn: $turnOn)
              .onChange(of: turnOn) { value in
                if turnOn{
                    motion.start()
                }
                else {
                    motion.stop()
                }
            }

        }
        
        if turnOn{
            HStack {
                Text("X: \(motion.x)")
                Text("Y: \(motion.y)")
                Text("Z: \(motion.z)")
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(motion: MotionManager())
    }
}

