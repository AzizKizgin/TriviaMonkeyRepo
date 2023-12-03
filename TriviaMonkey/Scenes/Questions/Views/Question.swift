//
//  Question.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 15.07.2023.
//

import SwiftUI

struct Question: View,Equatable {
    let questionIndex: Int
    let questionCount: Int
    let question: Trivia
    let checkAnswer: (Bool) -> Void
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text("question \(questionIndex + 1) of \(questionCount)")
                .foregroundColor(.white)
            Text(convertString(from: question.question))
                .foregroundColor(.white)
                .font(.title2)
            VStack{
                Answers(
                    answers: (question.incorrect_answers + [question.correct_answer]).shuffled(),
                    correctAnswer: question.correct_answer,
                    checkAnswer: checkAnswer
                )
            }
        }
        .frame(maxWidth: .infinity,alignment:.leading)
    }
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.questionIndex == rhs.questionIndex
    }
    
}
