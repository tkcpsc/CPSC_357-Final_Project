//
//  ContentView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            LogPracticeView()
                .tabItem {
                    Label("Log", systemImage: "pencil")
                }
            ProgressView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar")
                }
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview{}
