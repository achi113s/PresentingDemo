//
//  ContentView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import Presenting
import SwiftUI

struct ContentView: View {
    @State private var dialogDetail: TestData? = TestData()

    var body: some View {
        PresentingView(ExampleRoute.self) { presenter in
            NavigationStack {
                VStack(spacing: 15) {
                    Group {
                        Button("Show Alert") {
                            presenter.presentAlert(
                                Alert(title: Text("Test Alert"),
                                      message: Text("Are you liking the Presenting library?"),
                                      primaryButton: .default(Text("Absolutely")),
                                      secondaryButton: .destructive(Text("No"))
                                     )
                            )
                        }

                        Button("Show Toast") {
                            presenter.presentToast(
                                on: .bottom,
                                .success(message: "Success!"),
                                isAutoDismissed: true
                            )
                        }

                        Button("Show Settings Sheet") {
                            presenter.presentSheet(.settings)
                        }

                        Button("Show Full Screen Cover") {
                            presenter.presentFullScreenCover(.lockedView)
                        }

                        Button("Show Confirmation Dialog") {
                            presenter.presentConfirmationDialog(
                                ConfirmationDialog(Text("Test")) {
                                    Button("Test Button") {}
                                    Button("Test Button 2") {}
                                } message: {
                                    VStack {
                                        Text("This is a message!")
                                    }
                                }
                            )
                        }

                        Button("Dismiss Confirmation Dialog") {
                            presenter.dismissConfirmationDialog()
                        }

                        Button("Show Confirmation Dialog using Data") {
                            presenter.presentConfirmationDialog(
                                ConfirmationDialog(
                                    Text("Presenting"),
                                    titleVisibility: .automatic, presenting: dialogDetail,
                                    actions: { dialogDetail in
                                        Button(dialogDetail.button1name) {}
                                        Button(dialogDetail.button2name) {}
                                    }, message: { dialogDetail in
                                        Text(dialogDetail.message)
                                    }
                                )
                            )
                        }
                    }
                    .presentingDemoButton()
                }
                .toolbar(content: {
                    toolbarView
                })
            }
        }
    }

    private var toolbarView: some ToolbarContent {
        Group {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Presenting Demo")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
            }
        }
    }
}

#Preview {
    ContentView()
}
