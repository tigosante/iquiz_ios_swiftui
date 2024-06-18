//
//  QuestionView.swift
//  iquiz
//
//  Created by Tiago Silva on 16/06/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject private var router: RouterService
    
    @State var question = QuestionModel(
        question: "Question: What is 2 + 2?",
        answerList: ["Option 1", "Option 2", "Option 3"],
        correctAnswer: "Option 2"
    )
    
    var body: some View {
        BodyScreenView {
            Text(question.question)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .foregroundColor(.white)
                .padding()
            
            ForEach(question.answerList, id: \.self) { option in
                if question.answer == option && question.wasAnswered {
                    PrimaryButton(
                        label: option,
                        backgroundColor: question.isCorrectAnswer ? .green : .red
                    ) { }
                        .padding(.bottom, 32)
                } else if question.wasAnswered {
                    PrimaryButton(label: option) { }
                        .padding(.bottom, 32)
                } else {
                    PrimaryButton(label: option) {
                        question.reply(answer: option)
                    }
                    .padding(.bottom, 32)
                }
            }
            if question.wasAnswered {
                PrimaryButton(label: "Resultado") {
                    router.navigate(to: .result(question))
                }
            }
            Spacer()
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        QuestionView()
    }
}
