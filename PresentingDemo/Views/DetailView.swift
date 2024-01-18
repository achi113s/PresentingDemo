//
//  DetailView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "doc.text.magnifyingglass")
                .foregroundStyle(.blue)
                .fontWeight(.bold)
                .font(.system(size: 36))
            Text("This is a detail view.")
                .font(.headline)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
        }
    }
}

#Preview {
    DetailView()
}
