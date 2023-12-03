//
//  Answers.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 14.07.2023.
//

import SwiftUI

struct Answers: View{
    let answers: [String]
    let correctAnswer: String
    let checkAnswer: (Bool) -> Void
    @State var selectedAnswer = ""

    private func getColor(answer:String) -> Color {
        if selectedAnswer != "" {
            if(answer == correctAnswer){
                return .green
            }
            else if answer == selectedAnswer {
                return .red
            }
        }
            return .white
    }

    private func getTextColor(answer:String) -> Color {
        if selectedAnswer != "" {
            if(answer == correctAnswer || answer == selectedAnswer){
                return .white
            }
        }
        return .black
    }
    
    var body: some View {
        VStack{
            ForEach(answers, id: \.self){ answer in
                Button {
                    if selectedAnswer == "" {
                        selectedAnswer = answer
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            checkAnswer(answer == correctAnswer)
                            selectedAnswer = ""
                        }
                    }
                } label: {
                    Text(convertString(from: answer))
                        .foregroundColor(getTextColor(answer: answer))
                        .padding(8)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical,5)
                .buttonStyle(.borderedProminent)
                .tint(getColor(answer: answer))
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
            }
        }
    }
}

