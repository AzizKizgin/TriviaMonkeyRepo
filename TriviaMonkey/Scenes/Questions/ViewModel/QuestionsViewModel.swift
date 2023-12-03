//
//  QuestionsViewModel.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 12.07.2023.
//

import Foundation

class QuestionsViewModel: ObservableObject {
    @Published var trivias: [Trivia]?
    @Published var error: String?
    private let triviaService = TriviaApiService()
    
    func fetchTrivias(categoryId: Int, difficulty: Difficulty){
        triviaService.fetchTrivias(categoryId: categoryId,difficulty: difficulty){
            result ,error in
            guard let trivias = result else {
                self.error = error?.localizedDescription
                return
            }
            DispatchQueue.main.async {
                self.trivias = trivias
            }
        }
    }
}
