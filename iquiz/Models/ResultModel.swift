//
//  ResultModel.swift
//  iquiz
//
//  Created by Tiago Silva on 18/06/24.
//

import Foundation

struct ResultModel: Identifiable, Hashable, Equatable {
    let id = UUID()
    var questionCount: Int
    var hitCounter: Int
    
    init() {
        self.questionCount = 0
        self.hitCounter = 0
    }
    
    init(questionCount: Int, hitCounter: Int) {
        self.questionCount = questionCount
        self.hitCounter = hitCounter
    }
    
    mutating func setQuestionCount(count: Int) {
        questionCount = count
    }
    
    mutating func hitQuestion() {
        hitCounter = hitCounter + 1
    }
}
