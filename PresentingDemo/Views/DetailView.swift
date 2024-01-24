//
//  DetailView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import Presenting
import SwiftUI

struct DetailView: View {
    // The Presenter object is injected into the environment
    // when creating either a PresenterView or BasicPresenterView.
    // So, we can access the presenter in our sheet like so.
    @EnvironmentObject private var presenter: Presenter<ExampleRoute>

    @ObservedObject private var viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Image(systemName: viewModel.image)
                    .foregroundStyle(.blue)
                    .fontWeight(.bold)
                    .font(.system(size: 36))
                Text(viewModel.detailMessage)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)

                Button("Show Detail Sheet") {
                    presenter.presentSheet(.settings)
                }
                .presentingDemoButton()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presenter.dismissSheet()
                    } label: {
                        Text("Exit")
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}
