//
//  OnboardingView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 20.07.2023.
//

import SwiftUI

struct OnboardingView: View { 
    @State private var tabSelection = 0
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $tabSelection){
                WelcomeView()
                    .tag(0)
                InfoView()
                    .tag(1)
                SetUsernameView()
                    .tag(2)
            }
            .tabViewStyle(.page)
        }
        .frame(maxWidth: .infinity)
        .background(.green)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(UserSettingsViewModel())
    }
}
