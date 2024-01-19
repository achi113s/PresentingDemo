//
//  PresentingDemoButtonModifier.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/19/24.
//

import SwiftUI

struct PresentingDemoButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .fontWeight(.semibold)
            .fontDesign(.rounded)
    }
}

extension View {
    func presentingDemoButton() -> some View {
        modifier(PresentingDemoButton())
    }
}
