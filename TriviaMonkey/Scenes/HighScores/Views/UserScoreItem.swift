//
//  UserScoreItem.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 23.07.2023.
//

import SwiftUI

struct UserScoreItem: View {
    let user: UserData
    let index: Int
    let isCurrentUser: Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(ProfileColors.convertColor(user.color).opacity(0.3))
                .frame(height: 60)
            HStack{
                Circle()
                    .frame(width: 25)
                    .overlay{
                        Text("\(index)")
                            .foregroundColor(.white)
                    }
                UserPhoto(color: user.color, width: 40)
                if isCurrentUser {
                    Text("You")
                        .padding(.leading, 10)
                } else {
                    Text(user.username)
                        .padding(.leading, 10)
                }
                Spacer()
                Text("\(user.score)")
                Circle()
                    .frame(width: 10)
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .foregroundColor(ProfileColors.convertColor(user.color))
        }
    }
}

struct UserScoreItem_Previews: PreviewProvider {
    static var previews: some View {
        UserScoreItem(user: UserData(username: "user", color: "red", score: 100), index: 1,isCurrentUser: true)
    }
}
