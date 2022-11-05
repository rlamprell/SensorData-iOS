//
//  MotionTitleButtonView.swift
//  SensorData
//
//  Created by Rob Lamprell on 23/10/2022.
//


import SwiftUI


struct MotionDataView: View {
    @ObservedObject var motion: MotionManager
//    @ObservedObject var motion: MotionTitleButtonView
    @Binding var turnedOn: Bool
    
    var body: some View {
//        HStack {
//            Text("X: \(motion.x)")
////            Text("\(turnedOn)" as String)
//        }
        
        if turnedOn{
            HStack {
                Text("X: \(motion.x)")
                Text("Y: \(motion.y)")
                Text("Z: \(motion.z)")
            }
        }
    }
}



//
//struct MotionDataView_Previews: PreviewProvider {
//    static var previews: some View {
////        MotionDataView(motion: MotionManager())
//        return
//    }
//}
