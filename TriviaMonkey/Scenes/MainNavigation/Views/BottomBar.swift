//
//  BottomBar.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 11.07.2023.
//

import SwiftUI

struct BottomBar: View {
    @Binding var tabSelection: Int
    
    let barItems: [(index:Int,image:String, name:LocalizedStringKey)] = [
        (0,"house.fill","Home"),
        (1,"trophy.fill","Scoreboard"),
        (2,"person.fill","Account")
    ]
    var body: some View {
        Capsule()
            .frame(height: 70)
            .padding(.horizontal)
            .foregroundColor(.white)
            .shadow(radius: 2.5)
            .overlay{
                HStack(alignment: .center){
                    Spacer()
                    ForEach(barItems, id: \.index) { item in
                        VStack(spacing: 5){
                            Image(systemName: item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: item.index == tabSelection ? 25 : 22)
                                .foregroundColor(item.index == tabSelection ? .green : .green.opacity(0.9))
                            Text(item.name)
                                .font(.system(size: item.index == tabSelection ? 14 : 12))
                                .foregroundColor(.green)
                        }
                        .animation(.easeIn(duration: 0.2), value: tabSelection)
                        .onTapGesture {
                            tabSelection = item.index
                        }
                        Spacer()
                    }
                }
            }
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar(tabSelection: .constant(2))
    }
}
