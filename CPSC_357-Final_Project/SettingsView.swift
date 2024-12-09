//
//  SettingsView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//


import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                }
                Section(header: Text("About")) {
                    Text("GolfBuddy Lite v1.0")
                    Text("Created for golf enthusiasts.")
                }
            }
            .navigationTitle("Settings")
        }
    }
}
