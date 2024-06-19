//
//  QuestionView.swift
//  iquiz
//
//  Created by Tiago Silva on 16/06/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject private var router: RouterService
    @StateObject private var viewModel = QuestionViewModel()
    
    private var currentQuestion: QuestionModel { get { viewModel.currentQuestion } }
    private var questionList: [QuestionModel] { get { viewModel.questionList } }
    
    private func nextQuestion() {
        if !viewModel.nextQuestion() {
            router.navigate(to: .result(.init(questionCount: viewModel.questionCount, hitCounter: viewModel.hitCounter)))
        }
    }
    
    var body: some View {
        BodyScreen {
            Text(currentQuestion.question)
                .font(.system(size: 36))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 24)
                .padding(.vertical, 72)
            
            ForEach(currentQuestion.answerList, id: \.self) { option in
                if currentQuestion.answer == option && currentQuestion.wasAnswered {
                    PrimaryButton(
                        label: option,
                        backgroundColor: currentQuestion.isCorrectAnswer ? .green : .red
                    ) { }
                } else if currentQuestion.wasAnswered {
                    PrimaryButton(label: option) { }
                } else {
                    PrimaryButton(label: option) {
                        viewModel.replyQuestion(answer: option)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: nextQuestion)
                    }
                }
            }
            .padding(.bottom, 24)
            .padding(.horizontal, 24)
            
            Spacer()
            
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        QuestionView()
        .environmentObject(RouterService())
    }
}
