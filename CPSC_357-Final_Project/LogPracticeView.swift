//
//  LogPracticeView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//

import SwiftUI
import Combine // Import Combine for handling reactive updates to user input.

struct LogPracticeView: View {
    // The LogPracticeView struct conforms to the View protocol and provides a form for logging golf practice sessions.

    @EnvironmentObject var practiceData: PracticeData
    // Accesses the shared practice data to append new practice entries.

    @State private var practiceType: String = "Putting"
    // Tracks the selected type of practice (default is "Putting").

    @State private var performance: String = ""
    // Holds the user input for performance as a percentage string (e.g., "80").

    @State private var date = Date()
    // Stores the selected date for the practice session (default is the current date).

    var body: some View {
        // The body defines the layout and content of the LogPracticeView.
        NavigationView {
            // Embeds the form in a navigation view to enable a navigation bar.
            Form {
                // Form groups input fields and buttons in a structured and scrollable format.

                Section(header: Text("Practice Details")) {
                    // Section header describes the inputs for practice details.
                    
                    Picker("Practice Type", selection: $practiceType) {
                        // Picker allows the user to choose a practice type.
                        Text("Putting").tag("Putting")
                        // Represents a "Putting" option for the picker.
                        Text("Driving").tag("Driving")
                        // Represents a "Driving" option for the picker.
                    }

                    TextField("Performance (e.g., 80%)", text: $performance)
                        // Input field for the user to enter their performance percentage.
                        .keyboardType(.decimalPad)
                        // Ensures the keyboard is suitable for numeric input.
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        // Applies a rounded border style to the text field.
                        .onReceive(Just(performance)) { newValue in
                            // Monitors changes to the input field in real-time.
                            self.performance = filterNumericInput(newValue)
                            // Filters the input to allow only valid numeric values.
                        }
                        .overlay(
                            HStack {
                                // Adds a clear button to the right side of the text field.
                                Spacer()
                                if !performance.isEmpty {
                                    // Displays the clear button only when there is input.
                                    Button(action: {
                                        self.performance = ""
                                        // Clears the performance input when the button is tapped.
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                        // Displays an "xmark" icon for clearing input.
                                            .foregroundColor(.secondary)
                                            // Applies a secondary color to the icon.
                                    }
                                    .padding(.trailing, 8)
                                    // Adds padding to the right of the icon.
                                }
                            }
                        )

                    DatePicker("Date", selection: $date, displayedComponents: .date)
                        // Allows the user to select the date of the practice session.
                }

                Button("Save Practice") {
                    // Button to save the logged practice data.
                    if let performanceValue = Double(performance) {
                        // Converts the performance input to a double if it's valid.
                        let newEntry = PracticeEntry(date: date, practiceType: practiceType, performance: performanceValue)
                        // Creates a new PracticeEntry object with the provided details.
                        practiceData.entries.append(newEntry)
                        // Appends the new entry to the practice data.
                    }
                }
            }
            .navigationTitle("Log Practice")
            // Sets the navigation bar title to "Log Practice".
        }
    }

    private func filterNumericInput(_ input: String) -> String {
        // Filters the input to allow only valid decimal numbers with up to two decimal places.
        let pattern = "^[0-9]*\\.?[0-9]{0,2}$"
        // Regular expression to match numeric input with up to two decimal places.
        if let _ = input.range(of: pattern, options: .regularExpression) {
            return input
            // Returns the input if it matches the pattern.
        }
        return String(input.dropLast())
        // Removes the last character if the input doesn't match the pattern.
    }
}
