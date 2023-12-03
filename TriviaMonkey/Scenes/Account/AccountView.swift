//
//  AccountView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 11.07.2023.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var userSettings: UserSettingsViewModel
    @AppStorage("isDarkMode") var isDarkMode = false
    @State private var showingAlert: Bool = false
    var body: some View {
        Form{
            Section{
                VStack(spacing: 7){
                    UserPhoto(color:userSettings.color)
                    Text(userSettings.username)
                        .font(.title)
                    Text("Total Score: \(userSettings.score)")
                }
                .frame(maxWidth: .infinity)
            }
            Section(header:Text("Preferences")){
                Toggle("Dark Mode",isOn: $isDarkMode)
                Picker("Difficulty", selection: $userSettings.difficulty) {
                    ForEach(Difficulty.allCases, id: \.self) { difficulty in
                        Text(difficulty.displayName)
                    }
                }
                Picker("Duration", selection: $userSettings.duration) {
                    ForEach([10.0,15.0,20.0,25.0], id: \.self) { duration in
                        Text("\(Int(duration))")
                    }
                }
            }
            Section(header: Text("Profile Picture Color")){
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:0){
                        ForEach(ProfileColors.allColors, id: \.self){ color in
                            Button {
                                userSettings.color = color
                                DispatchQueue.main.async {
                                    userSettings.updateProfileColor()
                                }
                            } label: {
                                Circle()
                                    .foregroundColor(ProfileColors.convertColor(color))
                                    .frame(width: 60)
                                    .padding(.horizontal,5)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal,-20)
            }
            Section(header: Text("App Version")){
                Text(userSettings.version)
            }
            Button {
                showingAlert = true
            } label: {
                Text("Delete Your Account")
                    .frame(maxWidth: .infinity,alignment:.center)
            }
            .buttonStyle(.plain)
            .foregroundColor(.red)
            Section(header: Text("")) {
                 EmptyView()
             }
             .padding(.bottom, 100)
        }
        .foregroundColor(.green)
        .alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Are you sure you want to delete your account?"),
                message: Text("This action cannot be undone"),
                primaryButton: .destructive(Text("Yes")) {
                    userSettings.deleteUser()
                },
                secondaryButton: .cancel()
            )
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(UserSettingsViewModel())
    }
}
