//
//  ContentView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 11.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @State private var showOnboarding = true
    @StateObject var userSettings = UserSettingsViewModel()
    var body: some View {
        GeometryReader{ reader in
            VStack{
                if showSplash {
                    LaunchScreenView()
                        .onAppear{
                            showApp()
                        }
                }
                else if userSettings.user.isEmpty{
                    OnboardingView()
                }
                else{
                    MainNavigationView()
                }
            }
            .animation(.easeIn(duration: 0.7),value: showSplash)
            .safeAreaInset(edge: .top){
                Color.green
                    .frame(height: reader.safeAreaInsets.top)
                    .ignoresSafeArea()
            }
            .environmentObject(userSettings)
        }
    }
    
    private func showApp(){
        userSettings.getUser()
        userSettings.getAppVersion()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            showSplash = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
