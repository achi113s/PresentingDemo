//
//  TextStyleModifier.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/24/24.
//

import SwiftUI

struct PresentingDemoTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
    }
}

extension View {
    func presentingDemoTextStyle() -> some View {
        modifier(PresentingDemoTextStyle())
    }
}
