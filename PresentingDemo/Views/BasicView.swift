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
                .presentingDemoButton()
            }
        }
    }
}

#Preview {
    BasicView()
}
