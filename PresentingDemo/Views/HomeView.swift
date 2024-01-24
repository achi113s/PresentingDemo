//
//  ContentView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import Presenting
import SwiftUI

struct HomeView: View {
    private var dialogDetail: TestData? = TestData()

    private let buttonHeight: CGFloat = 35
    private let vstackSpacing: CGFloat = 15

    var body: some View {
        PresentingView(ExampleRoute.self) { presenter in
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: vstackSpacing) {
                        section1Title

                        Group {
                            Button {
                                presenter.presentAlert(
                                    Alert(title: Text("Test Alert"),
                                          message: Text("Are you liking the Presenting library?"),
                                          primaryButton: .default(Text("Yes")),
                                          secondaryButton: .destructive(Text("No"))
                                         )
                                )
                            } label: {
                                Text("Show Alert")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: buttonHeight)
                            }
                            .accessibilityIdentifier("ShowAlertButton")

                            Button {
                                presenter.presentSheet(.settings)
                            } label: {
                                Text("Show Settings Sheet")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: buttonHeight)
                            }
                            .accessibilityIdentifier("ShowSettingsSheetButton")

                            Button {
                                presenter.presentFullScreenCover(.lockedView)
                            } label: {
                                Text("Show Full Screen Cover")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: buttonHeight)
                            }
                            .accessibilityIdentifier("ShowFullScreenCoverButton")

                            Button {
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
                            } label: {
                                Text("Show Confirmation Dialog")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: buttonHeight)
                            }


                            Button {
                                presenter.dismissConfirmationDialog()
                            } label: {
                                Text("Dismiss Confirmation Dialog")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: buttonHeight)
                            }

                            Button {
                                presenter.presentConfirmationDialog(
                                    ConfirmationDialog(
                                        Text("Using Data"),
                                        titleVisibility: .visible,
                                        presenting: dialogDetail,
                                        actions: { dialogDetail in
                                            Button(dialogDetail.button1name) {}
                                            Button(dialogDetail.button2name) {}
                                        }, message: { dialogDetail in
                                            Text(dialogDetail.message)
                                        }
                                    )
                                )
                            } label: {
                                Text("Show Confirmation Dialog using Data")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: buttonHeight)
                            }
                        }
                        .presentingDemoButton()

                        section2Title

                        Grid {
                            GridRow {
                                ForEach(DefaultToasts.allCases[..<3]) { toast in
                                    Button {
                                        presenter.presentToast(
                                            on: .bottom,
                                            Toast(
                                                icon: toast.sfSymbol,
                                                color: toast.color,
                                                message: toast.id
                                            )
                                        )
                                    } label: {
                                        VStack {
                                            toast.sfSymbol

                                            Text("\(toast.id)")
                                        }
                                        .frame(width: 90, height: buttonHeight + 40)
                                    }
                                    .presentingDemoButton()
                                    .tint(toast.color)
                                }
                            }

                            GridRow {
                                ForEach(DefaultToasts.allCases[3...5]) { toast in
                                    Button {
                                        presenter.presentToast(
                                            on: .bottom,
                                            Toast(
                                                icon: toast.sfSymbol,
                                                color: toast.color,
                                                message: toast.id
                                            )
                                        )
                                    } label: {
                                        VStack {
                                            toast.sfSymbol

                                            Text("\(toast.id)")
                                        }
                                        .frame(width: 90, height: buttonHeight + 40)
                                    }
                                    .presentingDemoButton()
                                    .tint(toast.color)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .toolbar(content: {
                    toolbarView
                })
            }
        }
    }

    private var section1Title: some View {
        Text("Alerts, Sheets, Dialogs")
            .presentingDemoTextStyle()
    }

    private var section2Title: some View {
        Text("Toasts")
            .presentingDemoTextStyle()
    }

    private var toolbarView: some ToolbarContent {
        Group {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Presenting Demo")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .presentingDemoTextStyle()
            }
        }
    }
}

#Preview {
    HomeView()
}
