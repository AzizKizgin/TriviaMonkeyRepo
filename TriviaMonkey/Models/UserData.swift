//
//  UserData.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 22.07.2023.
//

import Foundation

struct UserData: Codable {
    var username: String
    var color: String
    var score: Int
    var date: Date?
}
