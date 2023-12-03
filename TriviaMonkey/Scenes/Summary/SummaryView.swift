//
//  SummaryView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 14.07.2023.
//

import SwiftUI

struct SummaryView: View {
    let onGoHomePress: () -> Void
    let color: Color
    let correctAnswerCount: Int
    @EnvironmentObject var userSettings: UserSettingsViewModel
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [color, color.opacity(0.8),color.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
            VStack{
                Logo()
                VStack(spacing:20){
                    Text("You answered \(getScore()) questions correctly")
                        .font(.title2)
                        .foregroundColor(.white)
                    Text("You earned \(getScore()) points")
                        .font(.title3)
                        .foregroundColor(.white)
                    Button {
                        DispatchQueue.main.async {
                            userSettings.updateScore(additionalScore: getScore())
                        }
                        onGoHomePress()
                    } label: {
                        Text("Go Home Screen")
                            .padding(5)
                            .font(.title2)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }
                .padding(.top,20)
            }
        }    .navigationBarBackButtonHidden()
    }
    
    private func getScore() -> Int{
        switch userSettings.difficulty {
        case .any:
            return correctAnswerCount * 15
        case .easy:
            return correctAnswerCount * 5
        case .medium:
            return correctAnswerCount * 10
        case .hard:
            return correctAnswerCount * 15
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(onGoHomePress: {},color: .blue,correctAnswerCount: 3)
            .environmentObject(UserSettingsViewModel())
    }
}
