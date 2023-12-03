//
//  Logo.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 22.07.2023.
//

import SwiftUI

struct Logo: View {
    var imageName = "logo"
    var width: CGFloat = 200
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
