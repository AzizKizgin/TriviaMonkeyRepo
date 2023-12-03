//
//  QuestionsHeader.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 15.07.2023.
//

import SwiftUI

struct QuestionsHeader: View {
    @Binding var time: Double
    let onClosePress: () -> Void
    var body: some View {
        HStack{
            Button {
                onClosePress()
            } label: {
                Image(systemName: "multiply.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 38, height: 38)
            }
            Spacer()
            TimeCounter(progress: $time)
        }
    }
}

struct QuestionsHeader_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsHeader(time: .constant(10.0),onClosePress: {})
    }
}
