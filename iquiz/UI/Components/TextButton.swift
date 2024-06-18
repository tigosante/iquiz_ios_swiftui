//
//  TextButton.swift
//  iquiz
//
//  Created by Tiago Silva on 13/06/24.
//

import SwiftUI

enum ColorScheameType: String {
    case primary = "primaryColor"
    case secondary = "secondaryColor"
}

struct TextButton: View {
    let label: String
    let type: ColorScheameType
    
    var body: some View {
        Text(label)
            .padding(.horizontal, 80)
            .padding(.vertical, 14)
            .foregroundColor(Color(type.rawValue))
            .font(.title3)
            .fontWeight(.bold)
    }
}

#Preview {
    TextButton(label: "Text Button", type: .primary)
}

#Preview {
    TextButton(label: "Text Button", type: .secondary)
}
