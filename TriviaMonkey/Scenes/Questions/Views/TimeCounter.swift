//
//  Timer.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 12.07.2023.
//

import SwiftUI

struct TimeCounter: View {
    @Binding var progress: Double
    @EnvironmentObject var userSettings: UserSettingsViewModel
        
        var body: some View {
            VStack {
                ZStack {
                    CircularProgressView(progress: (userSettings.duration - progress ) / userSettings.duration)
                    Text("\(progress, specifier: "%.0f")")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .bold()
                }.frame(width: 35, height: 35)
            }
        }
}

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    .white,
                    lineWidth: 3
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.black,
                    style: StrokeStyle(
                        lineWidth: 3,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)

        }
    }
}

struct TimeCounter_Previews: PreviewProvider {
    static var previews: some View {
        TimeCounter(progress: .constant(10))
    }
}
