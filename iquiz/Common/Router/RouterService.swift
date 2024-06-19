//
//  RouterService.swift
//  iquiz
//
//  Created by Tiago Silva on 18/06/24.
//

import Foundation
import SwiftUI

final class RouterService: ObservableObject {
    public enum RouteDestination: Hashable {
        case home
        case question([QuestionModel])
        case result(ResultModel)
    }
    
    @Published var stack = NavigationPath()
    
    @ViewBuilder func view(for route: RouteDestination) -> some View {
        switch route {
        case .home: HomeView()
        case .question(let questions):QuestionView(questionList: questions)
        case .result(let data): ResultView(result: data)
        }
    }
    
    func navigate(to destination: RouteDestination) {
        stack.append(destination)
    }
    
    func navigateBack() {
        stack.removeLast()
    }
    
    func navigateToRoot() {
        stack.removeLast(stack.count)
    }
}
