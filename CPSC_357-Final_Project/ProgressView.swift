//
//  ProgressView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//



import SwiftUI
import Charts // Import Charts for creating data visualizations.

struct ProgressView: View {
    // The ProgressView struct conforms to the View protocol and displays the user's practice performance over time.

    @EnvironmentObject var practiceData: PracticeData
    // The @EnvironmentObject property wrapper injects shared practice data into this view,
    // enabling access to user practice entries.

    var body: some View {
        // The body property defines the layout and content of the ProgressView.
        NavigationView {
            // Embeds the content inside a navigation view to provide a navigation title.
            VStack {
                // Arranges the chart and title vertically.
                Text("Your Progress")
                    .font(.title)
                    // Displays a title for the progress chart.

                Chart {
                    // Defines the chart view to visualize user practice data.
                    ForEach(practiceData.entries) { entry in
                        // Iterates through practice entries to plot data points.
                        LineMark(
                            x: .value("Date", entry.date),
                            // Maps the x-axis to the date of the practice entry.
                            y: .value("Performance", entry.performance)
                            // Maps the y-axis to the performance value of the practice entry.
                        )
                    }
                }
                .frame(height: 200)
                // Sets a fixed height for the chart.
            }
            .padding()
            // Adds padding around the VStack for spacing.
            .navigationTitle("Progress")
            // Sets the navigation bar title to "Progress".
        }
    }
}
