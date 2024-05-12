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
        //        TabView {
        //            GeometryReader { geometry in
        //                CombinedCardView()
        //                    .frame(height: geometry.size.height - 50) // Assuming TabView takes approx 50 points
        //            }
        //            .tabItem { Text("Sensors") }
        //            .tag(1)
        //
        //            SettingsView()
        //                .tabItem { Text("Settings") }
        //                .tag(2)
        //        }
        //        ZStack {
        //                    // Your underlying view
        //                    CombinedCardView()
        //                        // Example view
        //                        .background(Color.gray.opacity(0.5)) // Giving a distinct background to visualize
        //
        //                    // Positioned TabView
        //                    VStack {
        //                        Spacer() // Pushes the tab view to the bottom
        //                        TabView {
        //                            Text("Tab 1 Content")
        //                                .tabItem { Label("First", systemImage: "1.circle") }
        //                                .tag(1)
        //
        //                            Text("Tab 2 Content")
        //                                .tabItem { Label("Second", systemImage: "2.circle") }
        //                                .tag(2)
        //                        }
        //                        .frame(height: 50) // Limiting TabView's height
        //                        .background(Color.black.opacity(0.5)) // Making TabView semi-transparent
        //                    }
        //                }
        
        //        ZStack {
        //                    // Your underlying view
        //                    CombinedCardView()
        //                        // Example view
        //                        .background(Color.gray.opacity(0.5)) // Giving a distinct background to visualize
        //
        //                    // Positioned TabView
        //                    VStack {
        //                        Spacer() // Pushes the tab view to the bottom
        //                        TabView {
        //                            CombinedCardView()
        //                                .tabItem { Label("First", systemImage: "1.circle") }
        //                                .tag(1)
        //
        //                            SettingsView()
        //                                .tabItem { Label("Second", systemImage: "2.circle") }
        //                                .tag(2)
        //                        }
        //                        .frame(height: 50) // Limiting TabView's height
        //                        .background(Color.black.opacity(0.5)) // Making TabView semi-transparent
        //                    }
        //                }
        //        ZStack {
        //        TabView {
        //            CombinedCardView()
        //                .tabItem{
        //                    Image(systemName: "square.and.pencil")
        //                    Text("Sensors")
        //                        .foregroundColor(.white)
        //                }
        //                .tag(1)
        ////                .colorInvert()
        //            SettingsView()
        //                .tag(2)
        //                .tabItem{
        //                    Image(systemName: "gear")
        //                    Text("Settings")
        //                        .foregroundColor(.white)
        //                }
        //            //            CombinedCardView()
        //            //                .tag(3)
        //            //                .tabItem{ Text("Settings") }
        //            //            }.colorInvert()
        //        }
        //        .onAppear() {
        //            UITabBar.appearance().barTintColor = UIColor(.black)
        //            UITabBar.appearance().backgroundColor = .gray
        //
        //        }
        //        .tint(.red)
        //    }
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
