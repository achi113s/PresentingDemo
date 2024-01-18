//
//  BasicPresenterView.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/15/24.
//

import Presenting
import SwiftUI

struct BasicPresenterView: View {
    @State private var dialogDetail: TestData? = TestData()
    @State private var showNativeDataDialog: Bool = false

    var body: some View {
        BasicPresentingView { presenter in

            VStack {
                Group {
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
    BasicPresenterView()
}
