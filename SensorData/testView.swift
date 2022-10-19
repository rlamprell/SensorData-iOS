//
//  testView.swift
//  SensorData
//
//  Created by Rob Lamprell on 18/10/2022.
//

import SwiftUI

struct testView: View {
    let maggy   = MagnetManager()
    let acc     = AccelerManager()
    let gyro    = GyroManager()
    let motion  = DeviceMotion()
    var body: some View {
        ZStack {
            Color.black
                .padding(.horizontal, 16)
                .frame(height: 45)
                .frame(maxHeight: .infinity,
                       alignment: .top)
    
            Color.teal
                .padding(.horizontal, 16)
                .frame(height: 250)
                .frame(maxHeight: .infinity,
                       alignment: .bottom)
                .opacity(0.5)
                
            VStack {
                Text("view 1")
//                    .background(.black)
                    .foregroundColor(.white)
                    .frame(maxHeight: .infinity,
                           alignment: .top)
                    .font(.largeTitle)
            }
            
            VStack {
                ContentView(motion: maggy)
                ContentView(motion: acc)
                ContentView(motion: gyro)
                ContentView(motion: motion)
            }
            .padding(.horizontal, 16)
            .frame(maxHeight: .infinity,
                   alignment: .top)
            .offset(y: 60)
//            .font(.title)
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
