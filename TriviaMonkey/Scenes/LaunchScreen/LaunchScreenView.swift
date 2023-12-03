//
//  LaunchScreenView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 22.07.2023.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack{
            Logo(imageName:"logoWithLabel",width: 250)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
