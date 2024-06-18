//
//  PrimaryButton.swift
//  iquiz
//
//  Created by Tiago Silva on 13/06/24.
//

import SwiftUI

struct PrimaryButton: View {
    let label: String
    var onPressed: () -> Void
    let backgroundColor: Color
    
    init(label: String, onPressed: @escaping () -> Void) {
        self.label = label
        self.onPressed = onPressed
        self.backgroundColor = .primaryColorValue
    }
    
    init(label: String, backgroundColor: Color, onPressed: @escaping () -> Void) {
        self.label = label
        self.onPressed = onPressed
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Button {
            onPressed()
        } label: {
            TextButton(label: label, foregroundColor: .onPrimaryColorValue)
        }.frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(16)
    }
}

#Preview {
    Group {
        PrimaryButton(label: "Secondary button") {}
        PrimaryButton(label: "Secondary button", backgroundColor: .accentColor) {}
    }
}

