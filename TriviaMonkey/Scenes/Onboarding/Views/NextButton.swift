//
//  NextButton.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 20.07.2023.
//

import SwiftUI

struct NextButton: View {
    let onPress: () -> Void
    var body: some View {
        Button {
            onPress()
        } label: {
            Text("Next")
                .frame(width: 120,height: 30)
                .font(.title3)
                .bold()
        }
        .buttonStyle(.borderedProminent)
        .cornerRadius(15)
        .tint(.black.opacity(0.2))
        .padding(.bottom,40)
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        NextButton(onPress: {})
    }
}
