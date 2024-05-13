//
//  SettingsView.swift
//  SensorData
//
//  Created by Rob Lamprell on 18/10/2022.
//

import SwiftUI

struct SettingsView2: View {
//    @ObservedObject var connectionSettings: ConnectionSettings
    @StateObject var connectionSettings = ConnectionSettings()

    var body: some View {
        
//        let
        VStack {
            Text("hello")
            
//            settingsView2()
        }
    }
}

struct SettingsView: View {
//    @ObservedObject var connectionSettings = ConnectionSettings()
    @EnvironmentObject var connectionSettings: ConnectionSettings
    @State private var placeholder: String = ""
    
    var body: some View {
        VStack {            
            TextField("Enter IP Address", text: $connectionSettings.ipAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Enter Port Number", text: $connectionSettings.portNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Set a Poilling Rate (milliseconds)", text: $placeholder)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            OutputSelection()
        }
        .padding()
    }
}

//struct myView: View {
//    @StateObject private var connectionSettings = ConnectionSettings()
//
//    var body: some View {
//        VStack {
//            SettingsView()
//            // Add other UI elements and functionality here as needed
//        }
//    }
//}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var connectionSettings = ConnectionSettings()
        SettingsView()
            .environmentObject(connectionSettings)
    }
}
