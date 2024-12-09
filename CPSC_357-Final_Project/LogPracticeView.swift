//
//  LogPracticeView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//


import SwiftUI
import Combine

struct LogPracticeView: View {
    @EnvironmentObject var practiceData: PracticeData
    @State private var practiceType: String = "Putting"
    @State private var performance: String = ""
    @State private var date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Practice Details")) {
                    Picker("Practice Type", selection: $practiceType) {
                        Text("Putting").tag("Putting")
                        Text("Driving").tag("Driving")
                    }
                    TextField("Performance (e.g., 80%)", text: $performance)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onReceive(Just(performance)) { newValue in
                            self.performance = filterNumericInput(newValue)
                        }
                        .overlay(
                            HStack {
                                Spacer()
                                if !performance.isEmpty {
                                    Button(action: {
                                        self.performance = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.trailing, 8)
                                }
                            }
                        )
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
                Button("Save Practice") {
                    if let performanceValue = Double(performance) {
                        let newEntry = PracticeEntry(date: date, practiceType: practiceType, performance: performanceValue)
                        practiceData.entries.append(newEntry)
                    }
                }
            }
            .navigationTitle("Log Practice")
        }
    }

    private func filterNumericInput(_ input: String) -> String {
        let pattern = "^[0-9]*\\.?[0-9]{0,2}$"
        if let _ = input.range(of: pattern, options: .regularExpression) {
            return input
        }
        return String(input.dropLast())
    }
}
