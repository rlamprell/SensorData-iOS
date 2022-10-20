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
            newName()
                .tabItem{ Text("Sensors") }
                .tag(1)
            SettingsView()
                .tag(2)
                .tabItem{ Text("Settings") }
        }
    }
}

struct tabViewTest_Previews: PreviewProvider {
    static var previews: some View {
        tabViewTest()
        SettingsView()
    }
}
