//
//  HomeViewUITests.swift
//  PresentingDemoUITests
//
//  Created by Giorgio Latour on 1/23/24.
//

import XCTest

final class HomeViewUITests: XCTestCase {
    private let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws { }

    func testHomeViewShowAlertButtonShowsAlert() {
        let showAlertButton = app.scrollViews.otherElements.buttons["ShowAlertButton"]

        showAlertButton.tap()

        let alert = app.alerts["Test Alert"]
        XCTAssertTrue(alert.exists)
    }

    func testHomeViewAlertDisappears() {
        let showAlertButton = app.scrollViews.otherElements.buttons["ShowAlertButton"]
        showAlertButton.tap()
        let alert = app.alerts["Test Alert"]

        alert.scrollViews.otherElements.buttons["Yes"].tap()

        XCTAssertFalse(alert.exists)
    }

    func testHomeViewShowSettingsSheetButtonShowsSheet() {
        let showSettingsSheetButton = app.scrollViews.otherElements.buttons["Show Settings Sheet"]

        showSettingsSheetButton.tap()
        let settingsSheet = app.otherElements["SettingsSheet"]

        XCTAssertTrue(settingsSheet.exists)
    }
}
