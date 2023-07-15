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


class screenDims {
    let screenWidth:    CGFloat
    let screenHeight:   CGFloat
    let topCardHeight:  CGFloat
    let botCardHeight:  CGFloat
    let botPadding:     CGFloat

    init(){
        self.screenWidth     = UIScreen.main.bounds.size.width
        self.screenHeight    = UIScreen.main.bounds.size.height
        self.topCardHeight   = CGFloat(Int(self.screenHeight/1.3))
        self.botPadding      = 40.0
        self.botCardHeight   = self.screenHeight - self.topCardHeight + self.botPadding
    }
}


struct CombinedCardView: View {
    @StateObject var maggy  = MagnetManager()
    @StateObject var acc    = AccelerManager()
    @StateObject var gyro   = GyroManager()
    
    @State private var isMagOn = false
    @State private var isAccOn = false
    @State private var isGyrOn = false
    
    public let screenHeight     = screenDims().screenHeight
    public let screenWidth      = screenDims().screenWidth
    public let topCardHeight    = screenDims().topCardHeight
    public let botCardHeight    = screenDims().botCardHeight
    
    var body: some View {
//        print("hi")
//        NSLog("Can anyone hear me?")
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
    let magSensorInstance: MotionTitleButtonView
    let accSensorInstance: MotionTitleButtonView
    let gyrSensorInstance: MotionTitleButtonView
    let screenWidth = screenDims().screenWidth

    var body: some View {
        VStack(spacing: 28) {
            Text("Sensor Data")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 50)
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
        .frame(width: screenWidth, height: screenDims().topCardHeight, alignment: .top)
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
                .stroke(.white, lineWidth: 10)
                .cornerRadius(900, corners: [.topLeft, .bottomRight, .topRight])
        )
        .frame(maxHeight: .infinity,
               alignment: .top)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CardWideTextView: View {
    let magSensorInstance: MotionTitleButtonView
    let accSensorInstance: MotionTitleButtonView
    let gyrSensorInstance: MotionTitleButtonView
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Output:")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            MotionDataView(motion: magSensorInstance.motion, turnedOn: magSensorInstance.$turnedOn)
            MotionDataView(motion: accSensorInstance.motion, turnedOn: accSensorInstance.$turnedOn)
            MotionDataView(motion: gyrSensorInstance.motion, turnedOn: gyrSensorInstance.$turnedOn)
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .padding(.top, 76)
        .frame(width: screenWidth, height: screenDims().botCardHeight)
        .background(LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(.blue).opacity(0.6),
                      location: 0),
                .init(color: Color(.blue).opacity(0.6),
                      location: 1)]),
            startPoint: UnitPoint(x:0.5, y:3.08e-1), endPoint: UnitPoint(x:-0.001, y:0.977)))
        .frame(maxHeight: .infinity,
               alignment: .bottom)
    }
}




struct CardWideView_Previews: PreviewProvider {
    static var previews: some View {
        CombinedCardView()
    }
}
