//
//  ContentView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/3/24.
//


import SwiftUI // Import the SwiftUI framework for building the user interface.

struct ContentView: View {
    // The ContentView struct conforms to the View protocol and serves as the root view of the app.

    @StateObject private var practiceData = PracticeData()
    // The @StateObject property wrapper initializes a single instance of PracticeData.
    // This ensures that the data is managed as a source of truth and is shared across views.

    var body: some View {
        // The body property defines the content and layout of the ContentView.
        TabView {
            // A TabView creates a tab bar interface, allowing navigation between different views.

            HomeView()
                .tabItem {
                    // Adds a tab item for the HomeView with a label and system icon.
                    Label("Home", systemImage: "house")
                    // Label combines text ("Home") and an icon ("house").
                }

            LogPracticeView()
                .tabItem {
                    // Adds a tab item for the LogPracticeView, used to log practice sessions.
                    Label("Log", systemImage: "pencil")
                    // Label combines text ("Log") and an icon ("pencil").
                }

            ProgressView()
                .tabItem {
                    // Adds a tab item for the ProgressView, displaying the user's progress.
                    Label("Progress", systemImage: "chart.bar")
                    // Label combines text ("Progress") and an icon ("chart.bar").
                }

            MapView()
                .tabItem {
                    // Adds a tab item for the MapView, showing nearby golf ranges or locations.
                    Label("Map", systemImage: "map")
                    // Label combines text ("Map") and an icon ("map").
                }

            SettingsView()
                .tabItem {
                    // Adds a tab item for the SettingsView, providing access to app settings.
                    Label("Settings", systemImage: "gear")
                    // Label combines text ("Settings") and an icon ("gear").
                }
        }
        .environmentObject(practiceData)
        // Injects the practiceData object into the environment, making it accessible to all child views.
    }
}
