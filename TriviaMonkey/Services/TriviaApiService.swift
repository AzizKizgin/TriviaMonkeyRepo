//
//  TriviaApiService.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 11.07.2023.
//

import Foundation

class TriviaApiService {
    
    func fetchTrivias(categoryId:Int,difficulty: Difficulty, completion: @escaping([Trivia]?,Error?) -> Void){
        var urlString = Urls.baseUrl+"?amount=10&category=\(categoryId)&type=multiple&encode=base64"
        if difficulty != .any {
            urlString += "&difficulty=\(difficulty)"
        }
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "", code: -1, userInfo: nil))
            return
        }
         
        URLSession.shared.dataTask(with: url){ data, response ,error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do{
                let triviaResponse = try JSONDecoder().decode(TriviaResponse.self, from: data)
                let trivias = triviaResponse.results
                completion(trivias,nil)
            }catch{
                completion(nil,error)
            }
        }.resume()
    }
}
