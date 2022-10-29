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


struct CardWideView: View {
    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("text1")
                    .font(.title)
                    .fontWeight(.bold)
                Text("some other text")
                    .lineLimit(2)
                    .opacity(0.7)
            }
            .foregroundColor(.white)
            .padding(16)
            .frame(width: screenWidth, height: 625)
            .background(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(.purple).opacity(1),
                          location: 0),
                    .init(color: Color(.blue).opacity(1),
                          location: 1)]),
                startPoint: UnitPoint(x:0.5, y:3.08e-1), endPoint: UnitPoint(x:-0.001, y:0.977)))
            .cornerRadius(68, corners: [.bottomLeft, .bottomRight])
            //        .frame(alignment: .top)
            .frame(maxHeight: .infinity,
                   alignment: .top)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CardWideTextView: View {
    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("text1")
                    .font(.title)
                    .fontWeight(.bold)
                Text("some other text")
                    .lineLimit(2)
                    .opacity(0.7)
            }
            .foregroundColor(.white)
            .padding(16)
            .frame(width: screenWidth, height: 550)
            .background(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(.blue).opacity(0.6),
                          location: 0),
                    .init(color: Color(.white).opacity(0.6),
                          location: 1)]),
                startPoint: UnitPoint(x:0.5, y:3.08e-1), endPoint: UnitPoint(x:-0.001, y:0.977)))
            
//            .cornerRadius(68, corners: [.bottomLeft, .bottomRight])
            //        .frame(alignment: .top)
            .frame(maxHeight: .infinity,
                   alignment: .bottom)

    }
}


struct CardWideCombinedView: View {
    
    var body: some View {
        ZStack {
            CardWideTextView()
            CardWideView()
        }
    }
}


struct CardWideView_Previews: PreviewProvider {
    static var previews: some View {
        CardWideCombinedView()
        CardWideView()
        CardWideTextView()
//        Spacer()
    }
}
