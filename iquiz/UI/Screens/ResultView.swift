//
//  RestartView.swift
//  iquiz
//
//  Created by Tiago Silva on 16/06/24.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject private var router: RouterService
    private var percent: Int { get { (result.hitCounter / result.questionCount) * 100 } }
    var result: ResultModel
    
    var body: some View {
        BodyScreenView {
            Text("Você finalizou o iQuiz!")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 40)
            
            Text("Você acertou \(result.hitCounter) de \(result.questionCount) questões")
                .font(.system(size: 38))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.bottom, 40)
            
            Text("Percentual final: \(percent)%")
                .font(.system(size: 26))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.bottom, 40)
            
            PrimaryButton(label: "Reiniciar Quiz") {
                router.navigateToRoot()
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        ResultView(result: .init(questionCount: 10, hitCounter: 2))
    }
}
