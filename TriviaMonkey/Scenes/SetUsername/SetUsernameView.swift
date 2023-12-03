//
//  AddNameView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 20.07.2023.
//

import SwiftUI

struct SetUsernameView: View {
    @EnvironmentObject var userSettings: UserSettingsViewModel
    @State var showingAlert: Bool = false
    var body: some View {
        VStack{
            Logo()
            Text("Enter Name to Continue")
                .foregroundColor(.white)
                .font(.title)
            NameTextField(name: $userSettings.username)
            NextButton(onPress: onNextButtonPress)
                .opacity(userSettings.username.isEmpty ? 0 : 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
        .animation(.easeIn(duration: 0.3), value: userSettings.username.isEmpty)
        .alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Are you sure you want to use this name?"),
                message: Text("You can't change it later!"),
                primaryButton: .destructive(Text("Yes")) {
                    userSettings.createUser()
                },
                secondaryButton: .cancel()
            )
        }
        .alert(userSettings.error, isPresented: .constant(!userSettings.error.isEmpty)){
            Button("OK", role: .cancel) {
                userSettings.error = ""
            }
        }
    }
    
    private func onNextButtonPress(){
        showingAlert = true
    }
}

struct SetUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        SetUsernameView()
        .environmentObject(UserSettingsViewModel())
    }
}
