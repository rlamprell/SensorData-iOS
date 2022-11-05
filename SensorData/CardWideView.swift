//
//  CardView.swift
//  SensorData
//
//  Created by Rob Lamprell on 25/10/2022.
//

import SwiftUI


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct complete_CombinedCardView: View {
    @StateObject var maggy  = MagnetManager()
    @StateObject var acc    = AccelerManager()
    @StateObject var gyro   = GyroManager()
    
    @State private var isMagOn = false
    @State private var isAccOn = false
    @State private var isGyrOn = false
    var body: some View {
        let magSensorInstance = MotionTitleButtonView(motion: maggy, turnedOn: $isMagOn)
        let accSensorInstance = MotionTitleButtonView(motion: acc, turnedOn: $isAccOn)
        let gyrSensorInstance = MotionTitleButtonView(motion: gyro, turnedOn: $isGyrOn)
        
        ZStack {
            CardWideTextView(magSensorInstance: magSensorInstance,
                             accSensorInstance: accSensorInstance, gyrSensorInstance: gyrSensorInstance)
            CardWideView(magSensorInstance: magSensorInstance,
                         accSensorInstance: accSensorInstance, gyrSensorInstance: gyrSensorInstance
            )
        }
    }
}



struct CardWideView: View {
    
    
//    @StateObject var maggy  = MagnetManager()
//    @StateObject var acc    = AccelerManager()
//    @StateObject var gyro   = GyroManager()
//
//    @State private var isMagOn = false
//    @State private var isAccOn = false
//    @State private var isGyrOn = false
    let magSensorInstance: MotionTitleButtonView
    let accSensorInstance: MotionTitleButtonView
    let gyrSensorInstance: MotionTitleButtonView
    
    
    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
        
//        let magSensorInstance = MotionTitleButtonView(motion: maggy, turnedOn: $isMagOn)
//        let accSensorInstance = MotionTitleButtonView(motion: acc, turnedOn: $isAccOn)
//        let gyrSensorInstance = MotionTitleButtonView(motion: gyro, turnedOn: $isGyrOn)
        
            VStack(spacing: 28) {
                Text("Sensor Data")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
//                    .frame(minHeight:400, alignment: .top)
                Text("Enable sensors for tracking:")
                    .font(.title3)
                    .lineLimit(2)
                    .opacity(0.7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                magSensorInstance
                accSensorInstance
                gyrSensorInstance
            }
            .foregroundColor(.white)
            .padding(16)
            .frame(width: screenWidth, height: 675, alignment: .top)
            .background(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(.purple).opacity(1),
                          location: 0),
                    .init(color: Color(.blue).opacity(1),
                          location: 1)]),
                startPoint: UnitPoint(x:0.5, y:3.08e-1), endPoint: UnitPoint(x:-0.001, y:0.977)))
            .cornerRadius(68, corners: [.bottomLeft, .bottomRight])
            .overlay(
                RoundedRectangle(cornerRadius: 68)
                    .stroke(.green, lineWidth: 10)
                    .cornerRadius(900, corners: [.topLeft, .bottomRight, .topRight])
            )
            .frame(maxHeight: .infinity,
                   alignment: .top)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CardWideTextView: View {
//    @ObservedObject var magSensorInstance: MotionManager
//    magSensorInstance
    
    let magSensorInstance: MotionTitleButtonView
    let accSensorInstance: MotionTitleButtonView
    let gyrSensorInstance: MotionTitleButtonView
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    
    
    var body: some View {
        

            VStack(alignment: .leading, spacing: 8) {

                MotionDataView(motion: magSensorInstance.motion, turnedOn: magSensorInstance.$turnedOn)
                MotionDataView(motion: accSensorInstance.motion, turnedOn: accSensorInstance.$turnedOn)
                MotionDataView(motion: gyrSensorInstance.motion, turnedOn: gyrSensorInstance.$turnedOn)
                
                Text("text1")
                    .font(.title)
                    .fontWeight(.bold)
                Text("some other text")
                    .lineLimit(2)
                    .opacity(0.7)
            }
            .foregroundColor(.white)
            .padding(16)
            .frame(width: screenWidth, height: 300)
            .background(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(.blue).opacity(0.6),
                          location: 0),
                    .init(color: Color(.white).opacity(0.6),
                          location: 1)]),
                startPoint: UnitPoint(x:0.5, y:3.08e-1), endPoint: UnitPoint(x:-0.001, y:0.977)))
            .frame(maxHeight: .infinity,
                   alignment: .bottom)

    }
}


//struct CardWideCombinedView: View {
//
//    var body: some View {
//        ZStack {
//            CardWideTextView()
//            CardWideView()
//        }
//    }
//}


struct CardWideView_Previews: PreviewProvider {
    static var previews: some View {
        complete_CombinedCardView()
//        CardWideCombinedView()
//        CardWideView()
//        CardWideTextView()
//        Spacer()
    }
}
