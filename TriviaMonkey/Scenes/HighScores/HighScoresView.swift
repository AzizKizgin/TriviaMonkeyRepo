//
//  HighScoresView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 23.07.2023.
//

import SwiftUI

struct HighScoresView: View {
    @StateObject var highScoresViewModel = HighScoresViewModel()
    @EnvironmentObject var userSettings: UserSettingsViewModel

    var body: some View {
        ScrollView{
            if !highScoresViewModel.users.contains(where: { $0.username == userSettings.username }){
                Text("Your total score is \(userSettings.score)")
                    .font(.title)
                    .foregroundColor(.green)
            }
            VStack{
                Text("Top Scores")
                    .font(.title)
                    .foregroundColor(.green)
                ForEach(Array(highScoresViewModel.users.enumerated()), id: \.element.username){ index, user in
                    UserScoreItem(user: user, index: index + 1,isCurrentUser: userSettings.username == user.username)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 150)
        }
        .onAppear{
            highScoresViewModel.fetchAllScores()
        }
    }
}

struct HighScoresView_Previews: PreviewProvider {
    static var previews: some View {
        HighScoresView()
            .environmentObject(UserSettingsViewModel())
    }
}


