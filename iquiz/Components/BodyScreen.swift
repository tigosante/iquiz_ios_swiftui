//
//  BodyScreenView.swift
//  iquiz
//
//  Created by Tiago Silva on 16/06/24.
//

import SwiftUI

struct BodyScreen<Content> : View where Content : View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(content: { content().padding(.horizontal,32) })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundColorValue)
    }
}

#Preview {
    BodyScreen {
        Text("Body")
            .font(.title)
            .foregroundColor(.white)
        Text("Body")
            .font(.title)
            .foregroundColor(.white)
        Text("Body")
            .font(.title)
            .foregroundColor(.white)
    }
}
