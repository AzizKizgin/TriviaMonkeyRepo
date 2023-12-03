//
//  HomeView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 11.07.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(spacing: 30){
                    ForEach(Categories,id: \.id){ category in
                        NavigationLink(destination: QuestionsView(category: category)){
                            CategoryItem(category: category)
                        }.buttonStyle(.plain)
                    }
                }
                .padding(.vertical)
            }
        }.navigationBarHidden(true)
           
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
