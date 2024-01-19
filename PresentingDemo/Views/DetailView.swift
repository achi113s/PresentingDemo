//
//  DetailView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import Presenting
import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var viewModel: DetailViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Image(systemName: viewModel.image)
                    .foregroundStyle(.blue)
                    .fontWeight(.bold)
                    .font(.system(size: 36))
                Text(viewModel.detailMessage)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)

                Button("Go to Settings") {
                    viewModel.goToSettingsTapped()
                }
                .presentingDemoButton()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.dismissSheetTapped()
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
