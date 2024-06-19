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
                    router.navigate(to: .question)
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
