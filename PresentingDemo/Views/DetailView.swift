//
//  DetailView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import SwiftUI

struct DetailView<ViewModel: DetailViewModelling>: View {
    @EnvironmentObject private var viewModel: ViewModel

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: viewModel.image)
                .foregroundStyle(.blue)
                .fontWeight(.bold)
                .font(.system(size: 36))
            Text(viewModel.detailMessage)
                .font(.headline)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
        }
    }
}

#Preview {
    DetailView<DetailViewModel>()
        .environmentObject(DetailViewModel())
}
