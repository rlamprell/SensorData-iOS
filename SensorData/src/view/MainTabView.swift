//
//  tabViewTest.swift
//  SensorData
//
//  Created by Rob Lamprell on 18/10/2022.
//

import SwiftUI


// need the connection settings to be at this level most likely
// this is so it can be set in the settings menu and sent to
// the combinedCardView for recording
struct MainTabView: View {
    var body: some View {
        TabView {
            Group {
                CombinedCardView()
                    .tabItem {
                        Label("Sensors", systemImage: "square.and.pencil")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
            UITabBar.appearance().backgroundColor = .white
            UITabBar.appearance().unselectedItemTintColor = .white
        }
    }
}

struct tabViewTest_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
//        CombinedCardView()
//        SettingsView()
    }
}
