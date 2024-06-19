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
            .frame(width: .infinity)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20))
            .fontWeight(.bold)
    }
}

#Preview {
    TextButton(label: "Text Button", foregroundColor: .primaryColorValue)
}
