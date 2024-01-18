//
//  ContentView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/11/24.
//

import Presenting
import SwiftUI

struct TestData {
    let button1name = "Button1"
    let button2name = "Button2"
    let message = "Message!"
}

struct ContentView: View {
    @State private var dialogDetail: TestData? = nil
    @State private var showNativeDataDialog: Bool = false

    var body: some View {
        PresentingView(ExampleRoute.self) { presenter in
                VStack {
                    Group {
                        Button("Go to Settings") {
                            presenter.presentSheet(.settings)
                        }

                        Button("Show Alert") {
                            presenter.presentAlert(Alert(title: Text("This is a test!")))
                        }

                        Button("Show Config Dialog") {
                            presenter.presentConfirmationDialog(
                                ConfirmationDialog(Text("Test")) {
                                    Button("Test Button") {}
                                    Button("Test Button2") {}
                                } message: {
                                    VStack {
                                        Text("This is a message!")
                                    }
                                }
                            )
                        }

                        Button("Show Config Dialog Data") {
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

                        Button("Show Native Config Dialog Data") {
                            showNativeDataDialog = true
                        }

                        Button("Dismiss Confirmation Dialog") {
                            presenter.dismissConfirmationDialog()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 15))
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                }
                .confirmationDialog(
                    Text("Native Confirm Dialog with Data"),
                    isPresented: $showNativeDataDialog,
                    titleVisibility: .automatic, presenting: dialogDetail) { dialogDetail in
                        Button(dialogDetail.button1name) {}
                        Button(dialogDetail.button2name) {}
                    } message: { dialogDetail in
                        Text(dialogDetail.message)
                    }

            }
    }
}

#Preview {
    ContentView()
}
