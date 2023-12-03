//
//  WelcomeView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 20.07.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Logo()
            Text("Welcome to TriviaMonkey")
                .font(.system(size: 28))
                .foregroundColor(.white)
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
