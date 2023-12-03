//
//  AppViewModle.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 22.07.2023.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

class UserSettingsViewModel: ObservableObject {
    @AppStorage("username") var user: String = ""
    @AppStorage("difficulty") var difficulty: Difficulty = .any
    @AppStorage("duration") var duration = 15.0
    @Published var username: String = ""
    @Published var color: String = ProfileColors.green
    @Published var score: Int = 0
    @Published var date: Date?
    @Published var error: String = ""
    @Published var version: String = ""

    
    private let firestore = FirebaseManager.shared.firestore
    private let errorMessage = "Oops! Something went wrong"
    
    func createUser(){
        guard !self.username.isEmpty else {
            self.error = "Username cannot be empty"
            return
        }
        
        firestore.collection("users")
            .whereField("username", isEqualTo: self.username)
            .limit(to: 1)
            .getDocuments { snapshot, error in
                if error != nil {
                    self.error = self.errorMessage
                    return
                }
                guard snapshot?.isEmpty == true else {
                    self.error = "Username is already taken"
                    return
                }
                
                let userData = UserData(username: self.username, color: self.color, score: self.score, date: Date())
                do {
                    try self.firestore.collection("users").document(self.username).setData(from: userData)
                    self.user = self.username
                } catch {
                    self.error = self.errorMessage
                }
            }
    }
    
    func getUser(){
        guard !user.isEmpty else {return}
        let docRef = firestore.collection("users").document(user)
        
        docRef.getDocument(as: UserData.self){ result in
            switch result {
            case .success(let user):
                self.username = user.username
                self.color = user.color
                self.score = user.score
                self.date = user.date
            case .failure:
                self.error = self.errorMessage
            }
        }
    }
    
    func updateScore(additionalScore: Int){
        let docRef = firestore.collection("users").document(username)
        docRef.getDocument(as: UserData.self) { result in
            switch result {
            case.success(let user):
                let currentScore = user.score
                let newScore = currentScore + additionalScore
                    docRef.updateData(["score": newScore]) { error in
                        if error != nil {
                            self.error = self.errorMessage
                        } else {
                            DispatchQueue.main.async {
                                self.score = newScore
                            }
                        }
                    }
            case.failure:
                self.error = self.errorMessage
            }
        }
    }
 
    func updateProfileColor(){
        let docRef = firestore.collection("users").document(username)
        docRef.updateData(["color": self.color]) { error in
            if error != nil {
                self.error = self.errorMessage
            }
        }
    }
    
    func getAppVersion(){
        let docRef = firestore.collection("app").document("appVersion")
        docRef.getDocument { document, error in
            guard let doc = document else {
                self.version = "1.0.0"
                return
            }
            
            if let data = doc.data(),
               let version = data["version"] as? String {
                DispatchQueue.main.async {
                    self.version = version
                }
            }
        }
    }
    
    func deleteUser(){
        let docRef = firestore.collection("users").document(username)
        docRef.delete { error in
            if error != nil {
                self.error = self.errorMessage
            } else {
                self.user = ""
                self.username = ""
                self.color = ProfileColors.green
                self.score = 0
                self.date = nil
                self.error = ""
                self.version = ""
            }
        }
    }
}
