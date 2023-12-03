//
//  MainNavigationView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 11.07.2023.
//

import SwiftUI

struct MainNavigationView: View {
    @State private var tabSelection = 0
    @AppStorage("isDarkMode") var isDarkMode = false
    @StateObject var tabbarSettings = TabbarSettings()
        var body: some View {
            TabView(selection: $tabSelection){
                HomeView()
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)
                    .environmentObject(tabbarSettings)
                HighScoresView()
                    .tag(1)
                    .toolbar(.hidden, for: .tabBar)
                AccountView()
                    .tag(2)
                    .toolbar(.hidden, for: .tabBar)
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .tabViewStyle(DefaultTabViewStyle())
            .ignoresSafeArea()
            .overlay(alignment:.bottom){
                BottomBar(tabSelection: $tabSelection)
                    .opacity(tabbarSettings.isVisible ? 1 : 0)
            }
        }
}

struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
            .environmentObject(UserSettingsViewModel())
    }
}
