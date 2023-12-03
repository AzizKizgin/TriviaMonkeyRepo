//
//  CategoryItem.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 12.07.2023.
//

import SwiftUI

struct CategoryItem: View {
    let category: Category
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Image(systemName: "play.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                Text(category.name)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .bold()
            }
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding(.horizontal,30)
            VStack{
                Image(category.image)
                    .resizable()
                    .frame(width: 150,height: 150)
            }
        }
        .frame(width: 350, height: 175)
        .background(
            LinearGradient(gradient: Gradient(colors: [category.color, category.color.opacity(0.8),category.color.opacity(0.6)]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(20)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(category: Categories[8])
    }
}
