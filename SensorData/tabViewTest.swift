//
//  tabViewTest.swift
//  SensorData
//
//  Created by Rob Lamprell on 18/10/2022.
//

import SwiftUI

struct tabViewTest: View {
    var body: some View {
        TabView {
            SensorView()
                .tabItem{ Text("Sensors") }
                .tag(1)
            SettingsView()
                .tabItem{ Text("Settings") }
                .tag(2)
        }
    }
}

struct tabViewTest_Previews: PreviewProvider {
    static var previews: some View {
        tabViewTest()
    }
}
