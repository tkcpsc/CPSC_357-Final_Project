//
//  ProgressView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//


import SwiftUI
import Charts

struct ProgressView: View {
    let data = [
        (date: "Mon", performance: 70),
        (date: "Tue", performance: 75),
        (date: "Wed", performance: 80)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Progress")
                    .font(.title)
                Chart(data, id: \.date) { point in
                    LineMark(
                        x: .value("Day", point.date),
                        y: .value("Performance", point.performance)
                    )
                }
                .frame(height: 200)
            }
            .padding()
            .navigationTitle("Progress")
        }
    }
}