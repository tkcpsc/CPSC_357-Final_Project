//
//  SettingsView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//


import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("About")) {
                    Text("GolfBuddy Lite v1.0")
                    Text("Created for golf enthusiasts.")
                }
            }
            .navigationTitle("Settings")
        }
    }
}