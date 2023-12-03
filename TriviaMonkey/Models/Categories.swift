//
//  Categories.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 11.07.2023.
//

import Foundation
import SwiftUI

struct Category {
    let id: Int
    let name: String
    let image: String
    let color: Color
}

let Categories: [Category] = [
    Category(id: 9, name: "General Knowledge", image: "general_knowledge", color: .blue),
    Category(id: 10, name: "Book", image: "book", color: .green),
    Category(id: 11, name: "Film", image: "film", color: .orange),
    Category(id: 12, name: "Music", image: "music", color: .pink),
    Category(id: 15, name: "Video Games", image: "video_games", color: .cyan),
    Category(id: 20, name: "Mythology", image: "mythology", color: .yellow),
    Category(id: 21, name: "Sports", image: "sports", color: .mint),
    Category(id: 22, name: "Geography", image: "geography", color: .purple),
    Category(id: 23, name: "History", image: "history", color: .indigo),
]
