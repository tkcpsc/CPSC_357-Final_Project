//
//  CPSC_357_Final_ProjectApp.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/3/24.
//


import SwiftUI

@main
struct CPSC_357_Final_ProjectApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
