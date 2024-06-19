//
//  QuestionView.swift
//  iquiz
//
//  Created by Tiago Silva on 16/06/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject private var router: RouterService
    @State private var currentQuestion: QuestionModel
    @State var questionList: [QuestionModel]
    
    init(questionList: [QuestionModel]) {
        self.questionList = questionList
        if let question = questionList.first {
            self.currentQuestion = question
        } else {
            self.currentQuestion = .init(question: "", answerList: [], correctAnswer: "")
        }
    }
    
    private var currentIndex: Int {
        get { questionList.firstIndex(where: { currentQuestion.id == $0.id }) ?? -1 }
    }
    
    private func nextQuestion() {
        if currentIndex >= 0 {
            let nextIndex = currentIndex + 1
            if nextIndex < questionList.count {
                currentQuestion = questionList[nextIndex]
                return
            }
        }
        print(questionList.filter { $0.isCorrectAnswer }.count)
        router.navigate(to: .result(.init(
            questionCount: questionList.count,
            hitCounter: questionList.filter { $0.isCorrectAnswer }.count
        )))
    }
    
    private func replyQuestion(answer: String) {
        currentQuestion.reply(answer: answer)
        if currentIndex >= 0 {
            questionList[currentIndex] = currentQuestion
        }
    }
    
    var body: some View {
        BodyScreenView {
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
                        replyQuestion(answer: option)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: nextQuestion)
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
        QuestionView(questionList: [
            .init(
                question: "Em que ano Vingadores Ultimato foi lançado?",
                answerList: ["2019", "2018", "2017"],
                correctAnswer: "2019"),
            .init(
                question: "Qual feitiço para desarmar o seu oponente, em Harry Potter?",
                answerList: ["Expecto Patronum", "Avada Kedavra", "Expelliarmus"],
                correctAnswer: "Expelliarmus")
        ])
        .environmentObject(RouterService())
    }
}
