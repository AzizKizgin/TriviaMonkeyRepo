//
//  QuestionsView.swift
//  TriviaMonkey
//
//  Created by Aziz Kızgın on 12.07.2023.
//

import SwiftUI

struct QuestionsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var tabbarSettings: TabbarSettings
    @EnvironmentObject var userSettings: UserSettingsViewModel
    let category: Category
    private let questionCount = 10
    @State private var time: Double
    @State private var questionIndex = 0
    @State private var correctAnswerCount = 0
    @State private var shouldNavigate = false
    @State private var showFinishAlert = false
    @State private var showTimeUpAlert = false
    @ObservedObject private var questionViewModel = QuestionsViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(category: Category, userSettings: UserSettingsViewModel = UserSettingsViewModel()){
        self.category = category
        self._time = State(initialValue: userSettings.duration)
    }
    var body: some View {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [category.color, category.color.opacity(0.8),category.color.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                    .navigationBarBackButtonHidden()
                    .alert(isPresented: $showTimeUpAlert){
                        Alert(
                            title: Text("Time is up!"),
                            dismissButton: .cancel{
                                shouldNavigate = true
                            }
                        )
                    }
                    .alert("Are you sure to finish", isPresented: $showFinishAlert){
                        Button("Yes", role: .destructive) {
                            shouldNavigate = true
                        }
                    }
                    .fullScreenCover(isPresented: $shouldNavigate){
                        SummaryView(onGoHomePress: onGoHomePress, color: category.color,correctAnswerCount: correctAnswerCount)
                    }
                    .onAppear{
                        time = userSettings.duration
                        tabbarSettings.isVisible = false
                        questionViewModel.fetchTrivias(categoryId: category.id,difficulty: userSettings.difficulty)
                    }
                    .onDisappear{
                        questionViewModel.trivias = nil
                        tabbarSettings.isVisible = true
                    }
                    .onReceive(timer) { _ in
                        if time > 0 && !showFinishAlert && questionViewModel.trivias?.count != nil{
                            time -= 1
                        }
                        else if time == 0 {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                if(!shouldNavigate){
                                    showTimeUpAlert = true
                                    timer.upstream.connect().cancel()
                                }
                            }
                        }
                    }


                VStack{
                    QuestionsHeader(time: $time,onClosePress: onClosePress)
                    Spacer()
                    if let questions = questionViewModel.trivias {
                        Question(questionIndex: questionIndex, questionCount: questions.count, question: questions[questionIndex], checkAnswer: checkAnswer)
                            .disabled(time==0)
                    }
                    else{
                        VStack{
                            ProgressView()
                                .tint(.white)
                                .scaleEffect(2)
                        }
                    }
                    Spacer()
                }
                .padding()
            }

            
         
    }
    
    private func checkAnswer(isCorrect: Bool) {
        if isCorrect {
            if questionIndex < questionCount - 1 {
                questionIndex += 1
                time = userSettings.duration
                correctAnswerCount = questionIndex
            } else {
                correctAnswerCount = questionIndex + 1
                shouldNavigate = true
            }
        } else {
            shouldNavigate = true
        }
    }
    
    private func onGoHomePress(){
        dismiss()
    }
    
    private func onClosePress(){
        showFinishAlert = true 
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(category: Categories[8])
            .environmentObject(TabbarSettings())
    }
}
