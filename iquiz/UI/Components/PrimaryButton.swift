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
        self.backgroundColor = .secondaryColorValue
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
            TextButton(label: label, foregroundColor: .onSecondaryColorValue)
        }.frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(16)
    }
}

#Preview {
    Group {
        SecondaryButton(label: "Secondary button") {}
        SecondaryButton(label: "Secondary button", backgroundColor: .accentColor) {}
    }
}

