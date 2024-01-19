//
//  View-Extensions.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/18/24.
//

import Presenting
import SwiftUI

struct DependencyInjectingModifier<M: PresentingViewModel & ObservableObject>: ViewModifier {
    @EnvironmentObject private var presenter: Presenter<M.PresentableView>

    private let viewModel: M

    init(viewModel: M) {
        self.viewModel = viewModel
    }

    func body(content: Content) -> some View {
        inject(content)
            .environmentObject(viewModel)
    }

    private func inject<C: View>(_ content: C) -> some View {
        viewModel.presenter = presenter
        return content
    }
}

extension View {
    func inject<M: PresentingViewModel & ObservableObject>(_ viewModel: M) -> some View {
        modifier(DependencyInjectingModifier(viewModel: viewModel))
    }
}
