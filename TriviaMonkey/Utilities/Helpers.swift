//
//  Helpers.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 12.07.2023.
//

import Foundation

func convertString(from text: String) -> String{
    var decodedString = ""
    if let decodedData = Data(base64Encoded: text) {
        decodedString = String(data: decodedData, encoding: .utf8)!
        return decodedString
    }
    return ""
}
