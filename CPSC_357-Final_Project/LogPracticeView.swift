//
//  LogPracticeView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//

import SwiftUI
import Combine

struct LogPracticeView: View {
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
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onReceive(Just(performance)) { newValue in
                            self.performance = filterNumericInput(newValue)
                        }
                        .overlay(
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.performance = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.secondary)
                                }
                                .padding(.trailing, 8)
                                .opacity(performance.isEmpty ? 0 : 1)
                            }
                        )
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
                Button("Save Practice") {
                    print("Practice session saved: \(practiceType), \(performance), \(date)")
                }
            }
            .navigationTitle("Log Practice")
        }
    }

    // Input filtering function to allow only numeric input with one decimal point
    private func filterNumericInput(_ input: String) -> String {
        let allowedCharacters = "0123456789."
        let filtered = input.filter { allowedCharacters.contains($0) }
        let components = filtered.split(separator: ".")
        
        // Restrict to only one decimal point
        if components.count > 2 {
            return components[0] + "." + components[1]
        }
        return filtered
    }
}
