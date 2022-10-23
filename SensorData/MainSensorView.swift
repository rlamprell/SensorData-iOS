//
//  testView.swift
//  SensorData
//
//  Created by Rob Lamprell on 18/10/2022.
//

import SwiftUI


struct MainSensorView: View {
    @State private var name: String = "Tim"
    let screenBounds    = UIScreen.main.bounds
    let screenWidth     = UIScreen.main.bounds.width
    
    @StateObject var maggy           = MagnetManager()
    let acc             = AccelerManager()
    let gyro            = GyroManager()
    let motion          = DeviceMotion()
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
                Text("Sensor Data")
//                    .background(.black)
                    .foregroundColor(.white)
                    .frame(maxHeight: .infinity,
                           alignment: .top)
                    .font(.largeTitle)
            }
            
            VStack {
                MotionTitleButtonView(motion: maggy)
                MotionTitleButtonView(motion: acc)
                MotionTitleButtonView(motion: gyro)
                MotionTitleButtonView(motion: motion)
            }
            .padding(.horizontal, 16)
            .frame(maxHeight: .infinity,
                   alignment: .top)
            .offset(y: 60)
//            .font(.title)
            
            
            VStack(alignment: .leading) {
                Spacer()
                    .frame(minWidth: screenWidth-15, maxWidth: .infinity)
                    
                TextField("Enter your name", text: $name)
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                Text("Hello, \(name)!")
                    .padding(.horizontal, 15)
                    .padding(.bottom, 10)

            }
            .background(.black)
            .foregroundColor(.white)
            .frame(maxHeight: .infinity,
                   alignment: .bottom)
            .padding(.horizontal, 15)
            .padding(.bottom, 5)
            .fixedSize(horizontal: true, vertical: true)
            
            
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        MainSensorView()
    }
}
