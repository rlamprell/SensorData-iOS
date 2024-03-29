//
//  MotionTitleButtonView.swift
//  SensorData
//
//  Created by Rob Lamprell on 23/10/2022.
//


//
//  ContentView.swift
//  SensorData
//
//  Created by Rob Lamprell on 20/09/2022.
//


import SwiftUI

struct MotionTitleButtonView: View {
    @ObservedObject var motion: MotionManager
    @Binding var turnedOn: Bool // = false
    
    var body: some View {
        HStack {
            Toggle(motion.getSensorName(), isOn: $turnedOn)
              .onChange(of: turnedOn) { value in
                if turnedOn{
                    motion.start()
                }
                else {
                    motion.stop()
                }
            }
        }
    }
}




struct MotionTitleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(motion: MagnetManager())
    }
}
