//
//  RestartView.swift
//  iquiz
//
//  Created by Tiago Silva on 16/06/24.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject private var router: RouterService
    
    var result: QuestionModel
    
    var body: some View {
        BodyScreenView {
            Text("Quiz Result")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 8)
            
            Text("Your answer: \(result.answer)")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.bottom, 32)
            
            PrimaryButton(label: "Restart Quiz") {
                router.navigateToRoot()
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        ResultView(result: .init(question: "question", answerList: ["1", "2", "3"], correctAnswer: "1"))
    }
}
