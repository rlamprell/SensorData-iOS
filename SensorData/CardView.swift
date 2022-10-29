//
//  CardView.swift
//  SensorData
//
//  Created by Rob Lamprell on 25/10/2022.
//

import SwiftUI

struct CardView: View {
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
        .frame(width: 252, height: 320)
        .background(LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(.purple),
                      location: 0),
                .init(color: Color(.blue),
                      location: 1)]),
            startPoint: UnitPoint(x:0.5, y:3.08e-1), endPoint: UnitPoint(x:-0.001, y:0.977)))
        .cornerRadius(30)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
