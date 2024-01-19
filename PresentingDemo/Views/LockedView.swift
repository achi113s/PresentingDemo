//
//  FullScreenCoverView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/19/24.
//

import Presenting
import SwiftUI

struct LockedView: View {
    // The Presenter object is injected into the environment
    // when creating either a PresenterView or BasicPresenterView.
    // So, we can access the presenter in our subviews like so.
    @EnvironmentObject private var presenter: Presenter<ExampleRoute>

    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "lock")
                .foregroundStyle(.blue)
                .fontWeight(.bold)
                .font(.system(size: 36))
            Text("This is a full screen cover.")
                .font(.headline)
                .fontWeight(.semibold)
                .fontDesign(.rounded)

            Button("Dismiss Full Screen Cover") {
                presenter.dismissFullScreenCover()
            }
            .presentingDemoButton()
        }
    }
}

#Preview {
    LockedView()
}
