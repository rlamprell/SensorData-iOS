//
//  MotionTitleButtonView.swift
//  SensorData
//
//  Created by Rob Lamprell on 23/10/2022.
//


import SwiftUI


struct MotionDataView: View {
    @ObservedObject var motion: MotionManager
    @Binding var isTurnedOn: Bool
    
    var body: some View {
        if isTurnedOn{
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
