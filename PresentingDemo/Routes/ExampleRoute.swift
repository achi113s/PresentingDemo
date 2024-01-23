//
//  Route.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import Presenting
import SwiftUI

enum ExampleRoute: Presentable {
    case detail
    case settings
    case lockedView

    var body: some View {
        switch self {
        case .detail:
            DetailView<DetailViewModel>()
                .inject(DetailViewModel())
                .accessibilityIdentifier("DetailSheet")
        case .settings:
            SettingsView()
                .accessibilityIdentifier("SettingsSheet")
        case .lockedView:
            LockedView()
                .accessibilityIdentifier("LockedFullScreenCover")
        }
    }
}
