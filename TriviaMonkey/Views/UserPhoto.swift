//
//  UserPhoto.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 23.07.2023.
//

import SwiftUI

struct UserPhoto: View {
    let color: String
    var width: CGFloat = 160
    var body: some View {
        Circle()
            .foregroundColor(ProfileColors.convertColor(color))
            .frame(width: width)
            .overlay{
                Logo(imageName:"profileLogo",width: width * 0.69)
            }
    }
}

struct UserPhoto_Previews: PreviewProvider {
    static var previews: some View {
        UserPhoto(color: "red")
    }
}
