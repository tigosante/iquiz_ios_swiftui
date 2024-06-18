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
        BodyScreenView {
            VStack {
                Image(uiImage: .logo)
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
