//
//  SettingsView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//


import SwiftUI // SwiftUI framework is used for creating the user interface.

struct SettingsView: View {
    // The SettingsView struct conforms to the View protocol and represents the settings screen.

    @AppStorage("isDarkMode") private var isDarkMode = false
    // The @AppStorage property wrapper persists the isDarkMode value in user defaults,
    // allowing the app to remember the user's preference for dark mode.

    var body: some View {
        // The body property defines the layout and content of the settings screen.
        NavigationView {
            // Embeds the content inside a navigation view, enabling a navigation bar at the top.
            Form {
                // Form organizes the settings into structured, scrollable sections.
                
                Section(header: Text("Appearance")) {
                    // The first section, with a header "Appearance", contains settings related to visual themes.
                    Toggle(isOn: $isDarkMode) {
                        // A toggle switch bound to the isDarkMode variable.
                        Text("Dark Mode")
                        // Label for the toggle to describe its purpose.
                    }
                }
                
                Section(header: Text("About")) {
                    // The second section, with a header "About", provides app-related information.
                    Text("GolfBuddy Lite v1.0")
                    // Displays the app's version number.
                    Text("Created for golf enthusiasts.")
                    // Provides a brief description of the app's purpose.
                }
            }
            .navigationTitle("Settings")
            // Sets the title of the navigation bar to "Settings".
        }
    }
}
