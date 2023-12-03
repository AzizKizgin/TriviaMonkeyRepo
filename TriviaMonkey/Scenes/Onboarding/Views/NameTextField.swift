//
//  NameTextField.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 20.07.2023.
//

import SwiftUI

struct NameTextField: View {
    @Binding var name: String
    var body: some View {
        TextField("", text: $name, prompt: Text("Name").foregroundColor(.white.opacity(0.5)))
            .padding()
            .background(.black.opacity(0.2))
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.title3)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .bold()
            .padding()
    }
}

struct NameTextField_Previews: PreviewProvider {
    static var previews: some View {
        NameTextField(name: .constant("name"))
    }
}
