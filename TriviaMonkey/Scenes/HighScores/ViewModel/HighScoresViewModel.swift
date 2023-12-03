//
//  HighScoresViewModel.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 23.07.2023.
//

import Foundation

class HighScoresViewModel: ObservableObject {
    @Published var users: [UserData] = []
    @Published var error: String = ""
    private let firestore = FirebaseManager.shared.firestore
    private let errorMessage = "Oops! Something went wrong"
    
    func fetchAllScores(){
        firestore.collection("users")
            .whereField("score", isGreaterThan: 0)
            .order(by: "score", descending: true)
            .limit(to: 10)
            .getDocuments { snapshot, error in
                if error != nil {
                    self.error = self.errorMessage
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    self.error = self.errorMessage
                    return
                }
                
                let fetchedUsers = documents.compactMap { document -> UserData? in
                    let result = Result {
                        try document.data(as: UserData.self)
                    }
                    switch result {
                    case .success(let user):
                        return user
                    case .failure(_):
                        self.error = self.errorMessage
                        return nil
                    }
                }
                self.users = fetchedUsers
            }
    }
}
