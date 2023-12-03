//
//  FirebaseManager.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 20.07.2023.
//

import Foundation
import FirebaseFirestore


class FirebaseManager: NSObject {
    let firestore: Firestore
    static let shared = FirebaseManager()
    
    override init() {
        self.firestore = Firestore.firestore()
        super.init()
    }
}
