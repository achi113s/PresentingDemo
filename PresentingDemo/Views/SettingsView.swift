//
//  Settings.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import Presenting
import SwiftUI

struct SettingsView: View {
    // The Presenter object is injected into the environment
    // when creating either a PresenterView or BasicPresenterView.
    // So, we can access the presenter in our subviews like so.
    @EnvironmentObject private var presenter: Presenter<ExampleRoute>

    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Image(systemName: "gear")
                    .foregroundStyle(.blue)
                    .fontWeight(.bold)
                    .font(.system(size: 36))
                Text("This is a settings view.")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)

                Button("Go to Detail") {
                    presenter.presentSheet(.detail)
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
