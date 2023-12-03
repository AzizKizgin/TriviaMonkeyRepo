//
//  TriviaModel.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 11.07.2023.
//

import Foundation

struct Trivia: Codable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

struct TriviaResponse: Codable {
    let results: [Trivia]
}
