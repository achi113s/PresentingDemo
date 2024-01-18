//
//  Settings.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import SwiftUI
import Presenting

struct SettingsView: View {
    // The Presenter object is injected into the environment
    // when creating either a PresenterView or BasicPresenterView.
    // So, we can access the presenter in our subviews like so.
    @EnvironmentObject private var presenter: Presenter<ExampleRoute>
    
    var body: some View {
        VStack(spacing: 10) {
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
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 15))
            .fontWeight(.semibold)
            .fontDesign(.rounded)
        }
    }
}
