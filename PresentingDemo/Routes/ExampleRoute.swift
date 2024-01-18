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

    var body: some View {
        switch self {
        case .detail:
            DetailView<DetailViewModel>()
                .environmentObject(DetailViewModel())
        case .settings:
            SettingsView()
        }
    }
}
