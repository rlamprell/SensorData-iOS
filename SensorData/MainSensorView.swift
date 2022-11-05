//
//  testView.swift
//  SensorData
//
//  Created by Rob Lamprell on 18/10/2022.
//

import SwiftUI


struct enstantialSensors: View {
    
    
//    init() {
        @StateObject var maggy  = MagnetManager()
        @StateObject var acc    = AccelerManager()
        @StateObject var gyro   = GyroManager()
        
        @State var isMagOn = true
        @State var isAccOn = false
        @State var isGyrOn = false
//    }
    var body: some View {
        Text("hi")
    }
}


struct MainSensorView: View {
    @State private var name: String = "Tim"
    let screenBounds        = UIScreen.main.bounds
    let screenWidth         = UIScreen.main.bounds.width
    
//    @StateObject var maggy  = MagnetManager()
//    @StateObject var acc    = AccelerManager()
//    @StateObject var gyro   = GyroManager()
////    @StateObject var motion = DeviceMotion()
//
////    @State var x = MotionTitleButtonView(motion: MagnetManager())
//    @State private var isMagOn = false
//    @State private var isAccOn = false
//    @State private var isGyrOn = false
    
    var sensors = enstantialSensors()
//    @ObservedObject var maggy = sensors.maggy
    
//    var maggys  = MagnetManager()
    @State var myValue = true
    var body: some View {
        let magSensorInstance = MotionTitleButtonView(motion: sensors.maggy, turnedOn: sensors.$isMagOn)
//        let accSensorInstance = MotionTitleButtonView(motion: acc, turnedOn: $isAccOn)
//        let gyrSensorInstance = MotionTitleButtonView(motion: gyro, turnedOn: $isGyrOn)
//        let x = MotionTitleButtonView(motion: maggy)
//        let x_on = x.turnedOn
//        let x_on = Bool(x.turnedOn!) ?? false
//        var x_on = x.turnedOn
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
//                x
                magSensorInstance
//                accSensorInstance
//                gyrSensorInstance
//                MotionTitleButtonView(motion: maggy)
//                MotionTitleButtonView(motion: acc)
//                MotionTitleButtonView(motion: gyro)
//                MotionTitleButtonView(motion: motion)
//                Text("\(x.turnedOn)" as String)
//                maggy.getSensorName()
            }
            .padding(.horizontal, 16)
            .frame(maxHeight: .infinity,
                   alignment: .top)
            .offset(y: 60)
//            .font(.title)
            
            VStack {
                MotionDataView(motion: magSensorInstance.motion, turnedOn: magSensorInstance.$turnedOn)
//                MotionDataView(motion: accSensorInstance.motion, turnedOn: accSensorInstance.$turnedOn)
//                MotionDataView(motion: gyrSensorInstance.motion, turnedOn: gyrSensorInstance.$turnedOn)
//                MotionDataView(motion: maggy, isTurnedOn: x.$turnedOn)
//                MotionTitleButtonView(motion: acc)
//                MotionTitleButtonView(motion: gyro)
//                MotionTitleButtonView(motion: motion)
            }
            
//            VStack(alignment: .leading) {
//                Spacer()
//                    .frame(minWidth: screenWidth-15, maxWidth: .infinity)
//
//                TextField("Enter your name", text: $name)
//                    .padding(.horizontal, 15)
//                    .padding(.top, 10)
//                Text("Hello, \(name)!")
//                    .padding(.horizontal, 15)
//                    .padding(.bottom, 10)

//            }
//            .background(.black)
//            .foregroundColor(.white)
//            .frame(maxHeight: .infinity,
//                   alignment: .bottom)
//            .padding(.horizontal, 15)
//            .padding(.bottom, 5)
//            .fixedSize(horizontal: true, vertical: true)
            
            
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        MainSensorView()
    }
}
