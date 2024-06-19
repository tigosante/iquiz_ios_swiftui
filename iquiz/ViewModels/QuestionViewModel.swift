//
//  QuestionViewModel.swift
//  iquiz
//
//  Created by Tiago Silva on 19/06/24.
//

import Foundation

class QuestionViewModel: ObservableObject {
    @Published var questionList: [QuestionModel]
    @Published var currentQuestion: QuestionModel
    
    init() {
        let list: [QuestionModel] = [
            .init(
                question: "Em que ano Vingadores Ultimato foi lançado?",
                answerList: ["2019", "2018", "2017"],
                correctAnswer: "2019"),
            .init(
                question: "Qual feitiço para desarmar o seu oponente, em Harry Potter?",
                answerList: ["Expecto Patronum", "Avada Kedavra", "Expelliarmus"],
                correctAnswer: "Expelliarmus")
        ]
        self.questionList = list
        self.currentQuestion = list.first!
    }
    
    var questionCount: Int { get{ questionList.count } }
    var hitCounter: Int { get { questionList.filter { $0.isCorrectAnswer }.count } }
    
    private var currentIndex: Int {
        get { questionList.firstIndex(where: { currentQuestion.id == $0.id }) ?? -1 }
    }
    
    func nextQuestion() -> Bool {
        if currentIndex >= 0 {
            let nextIndex = currentIndex + 1
            if nextIndex < questionList.count {
                currentQuestion = questionList[nextIndex]
                return true
            }
        }
        return false
    }
    
    func replyQuestion(answer: String) {
        currentQuestion.reply(answer: answer)
        if currentIndex >= 0 {
            questionList[currentIndex] = currentQuestion
        }
    }

}
