//
//  ContentView.swift
//  SensorData
//
//  Created by Rob Lamprell on 20/09/2022.
//


import SwiftUI

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
            Text(motion.getSensorName())
            Text("X: \(motion.x)")
            Text("Y: \(motion.y)")
            Text("Z: \(motion.z)")
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(motion: MotionManager())
    }
}
