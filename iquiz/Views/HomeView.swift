//
//  HomeView.swift
//  iquiz
//
//  Created by Tiago Silva on 16/06/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router: RouterService
    
    var body: some View {
        BodyScreen {
            VStack {
                Image(uiImage: .logo)
                    .padding(32)
                PrimaryButton(label: "Iniciar quiz") {
                    router.navigate(to: .question([
                        .init(
                            question: "Em que ano Vingadores Ultimato foi lançado?",
                            answerList: ["2019", "2018", "2017"],
                            correctAnswer: "2019"),
                        .init(
                            question: "Qual feitiço para desarmar o seu oponente, em Harry Potter?",
                            answerList: ["Expecto Patronum", "Avada Kedavra", "Expelliarmus"],
                            correctAnswer: "Expelliarmus")
                    ]))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
