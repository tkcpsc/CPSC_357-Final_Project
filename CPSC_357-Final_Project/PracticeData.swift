//
//  PracticeData.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/9/24.
//

import Foundation

struct PracticeEntry: Identifiable {
    let id = UUID()
    let date: Date
    let practiceType: String
    let performance: Double
}

class PracticeData: ObservableObject {
    @Published var entries: [PracticeEntry] = []
}
