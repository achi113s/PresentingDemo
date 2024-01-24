//
//  BasicPresenterView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/15/24.
//

import Presenting
import SwiftUI

struct BasicView: View {
    @State private var dialogDetail: TestData? = TestData()

    private let buttonHeight: CGFloat = 35
    private let vstackSpacing: CGFloat = 15

    var body: some View {
        BasicPresentingView { presenter in
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: vstackSpacing) {
                        Text("Alerts, Sheets, Dialogs")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)

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
                            } label: {
                                Text("Show Confirmation Dialog using Data")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: buttonHeight)
                            }
                        }
                        .presentingDemoButton()

                        Text("Toasts")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                        
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
                    basicToolbarView
                })
            }
        }
    }

    private var basicToolbarView: some ToolbarContent {
        Group {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Basic Presenting Demo")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
            }
        }
    }
}

#Preview {
    BasicView()
}
