//
//  ProfileColors.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 22.07.2023.
//

import Foundation

import SwiftUI

struct ProfileColors {
    static let green = "green"
    static let blue = "blue"
    static let orange = "orange"
    static let pink = "pink"
    static let cyan = "cyan"
    static let yellow = "yellow"
    static let mint = "mint"
    static let purple = "purple"
    static let indigo = "indigo"
    static let black = "black"
    static let red = "red"

    static let allColors = [green, blue, orange, pink, cyan, yellow, mint, purple, indigo, black, red]

    static func convertColor(_ colorName: String) -> Color {
        switch colorName {
        case ProfileColors.green:
            return Color.green
        case ProfileColors.blue:
            return Color.blue
        case ProfileColors.orange:
            return Color.orange
        case ProfileColors.pink:
            return Color.pink
        case ProfileColors.cyan:
            return Color.cyan
        case ProfileColors.yellow:
            return Color.yellow
        case ProfileColors.mint:
            return Color.mint
        case ProfileColors.purple:
            return Color.purple
        case ProfileColors.indigo:
            return Color.indigo
        case ProfileColors.black:
            return Color.black
        case ProfileColors.red:
            return Color.red
        default:
            return Color.green
        }
    }
}
