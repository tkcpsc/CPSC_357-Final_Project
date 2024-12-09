//
//  HomeView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//


import SwiftUI

struct HomeView: View {
    // The HomeView struct conforms to the View protocol, representing a UI component in the app.
    var body: some View {
        VStack(spacing: 20) {
            // VStack arranges its children (subviews) vertically with 20 points of spacing between them.
            Text("Welcome to GolfBuddy Lite!")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Image("Image")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            Text("Track your golf practice and find nearby ranges.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
