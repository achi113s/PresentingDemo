//
//  DetailViewModel.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/18/24.
//

import Presenting
import SwiftUI

final class DetailViewModel: PresentingViewModel, DetailViewModelling, ObservableObject {
    typealias Destination = ExampleRoute

    var presenter: Presenter<ExampleRoute>?

    var image: String
    var detailMessage: String

    init(image: String = "doc.text.magnifyingglass",
         detailMessage: String = "This is a detail screen.") {
        self.image = image
        self.detailMessage = detailMessage
    }

    func goToSettingsTapped() {
        presenter?.presentSheet(.settings)
    }

    func dismissSheetTapped() {
        presenter?.dismissSheet()
    }
}
