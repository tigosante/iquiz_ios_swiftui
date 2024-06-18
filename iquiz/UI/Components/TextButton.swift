//
//  TextButton.swift
//  iquiz
//
//  Created by Tiago Silva on 13/06/24.
//

import SwiftUI

struct TextButton: View {
    let label: String
    let foregroundColor: Color
    
    var body: some View {
        Text(label)
            .padding(.horizontal, 80)
            .padding(.vertical, 14)
            .foregroundColor(foregroundColor)
            .font(.title3)
            .fontWeight(.bold)
    }
}

#Preview {
    TextButton(label: "Text Button", foregroundColor: .primaryColorValue)
}
