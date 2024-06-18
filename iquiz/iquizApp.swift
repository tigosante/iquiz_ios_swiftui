//
//  iquizApp.swift
//  iquiz
//
//  Created by Tiago Silva on 13/06/24.
//

import SwiftUI

@main
struct iquizApp: App {
    @ObservedObject private var router = RouterService()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.stack) {
                ContentView()
                    .navigationDestination(for: RouterService.RouteDestination.self, destination: router.view)
            }
            .environmentObject(router)
        }
    }
}
