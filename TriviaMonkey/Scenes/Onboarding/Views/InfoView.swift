//
//  InfoView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 26.07.2023.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack{
            Logo()
            Image("preferences")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text("You can change question duration or difficulty in account screen")
                .font(.title2)
                .multilineTextAlignment(.center)
            VStack(spacing:7){
                Text("Easy questions is 5 points")
                Text("Medium questions is 10 points")
                Text("Hard and any questions is 15 points")
            }
            .padding(.vertical)
            .font(.title3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
        .foregroundColor(.white)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
