//
//  MotionTitleButtonView.swift
//  SensorData
//
//  Created by Rob Lamprell on 23/10/2022.
//


import SwiftUI


struct MotionDataView: View {
    @ObservedObject var motion: MotionManager
    @Binding        var turnedOn: Bool
    
    var body: some View {
        if turnedOn{
            VStack {
                Text("\(motion.getSensorName())")
                HStack {
                    Text("X: \(motion.x)")
                    Text("Y: \(motion.y)")
                    Text("Z: \(motion.z)")
                }

            }
        }
    }
}
