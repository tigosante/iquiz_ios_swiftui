//
//  RestartView.swift
//  iquiz
//
//  Created by Tiago Silva on 16/06/24.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject private var router: RouterService
    var result: ResultModel
    
    private var percent: Int {
        get {
            Int(((Double(result.hitCounter) / Double(result.questionCount)) * 100))
        }
    }
    
    var body: some View {
        BodyScreenView {
            Text("Você finalizou o iQuiz!")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 40)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("Você acertou \(result.hitCounter) de \(result.questionCount) questões")
                .font(.system(size: 38))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.bottom, 40)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("Percentual final: \(percent)%")
                .font(.system(size: 26))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.bottom, 40)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
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
