//
//  File.swift
//  iquiz
//
//  Created by Tiago Silva on 18/06/24.
//

import Foundation

struct QuestionModel: Identifiable, Hashable, Equatable {
    let id = UUID()
    let question: String
    let answerList: [String]
    let correctAnswer: String
    
    private var currentAnswer: String
    
    var answer: String { get { currentAnswer } }
    var wasAnswered: Bool { get { !answer.isEmpty } }
    var isCorrectAnswer: Bool { get { currentAnswer == correctAnswer } }
    
    init(question: String, answerList: [String], correctAnswer: String) {
        self.question = question
        self.answerList = answerList
        self.correctAnswer = correctAnswer
        self.currentAnswer = ""
    }
    
    mutating func reply(answer: String) {
        self.currentAnswer = answer
    }
}
