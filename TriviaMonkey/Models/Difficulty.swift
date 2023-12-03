//
//  Difficulty.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 26.07.2023.
//

import Foundation

enum Difficulty: String, CaseIterable {
    case any = "any"
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"
    
    var displayName: String {
        switch self {
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        case .any:
            return "Any"
        }
    }
}
