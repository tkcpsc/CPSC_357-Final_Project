//
//  ProgressView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//


import SwiftUI
import Charts

struct ProgressView: View {
    @EnvironmentObject var practiceData: PracticeData

    var body: some View {
        NavigationView {
            VStack {
                Text("Your Progress")
                    .font(.title)
                Chart {
                    ForEach(practiceData.entries) { entry in
                        LineMark(
                            x: .value("Date", entry.date),
                            y: .value("Performance", entry.performance)
                        )
                    }
                }
                .frame(height: 200)
            }
            .padding()
            .navigationTitle("Progress")
        }
    }
}
