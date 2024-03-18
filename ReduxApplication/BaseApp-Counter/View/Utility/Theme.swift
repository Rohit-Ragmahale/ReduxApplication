//
//  Theme.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 18/03/24.
//

import Foundation
import SwiftUI

// ViewModifier to set theme
struct CustomThemeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.headline)
            .padding()
        
    }
}

//  Custom Styles

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.red.opacity(0.5))
            .font(.headline)
            .fontWeight(.bold)
            .padding()
        
    }
}
