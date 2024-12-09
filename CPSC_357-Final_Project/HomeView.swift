//
//  HomeView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to GolfBuddy Lite!")
                .font(.title)
                .multilineTextAlignment(.center)
            Text("Track your golf practice and find nearby ranges.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
