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

        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
    }

    func testHomeViewAlertDismisses() {
        let showAlertButton = app.scrollViews.otherElements.buttons["ShowAlertButton"]
        showAlertButton.tap()
        let alert = app.alerts.firstMatch

        alert.scrollViews.otherElements.buttons["Yes"].tap()
        let alertExists = alert.waitForExistence(timeout: 2)

        XCTAssertFalse(alertExists)
    }

    func testHomeViewShowSettingsSheetButtonShowsSheet() {
        let showSettingsSheetButton = app.scrollViews.otherElements.buttons["ShowSettingsSheetButton"]

        showSettingsSheetButton.tap()
        let settingsSheet = app.otherElements["SettingsSheet"]

        XCTAssertTrue(settingsSheet.exists)
    }

    func testHomeViewShowFullScreenCoverButtonShowsCover() {
        let showFullScreenCoverButton = app.scrollViews.otherElements.buttons["ShowFullScreenCoverButton"]

        showFullScreenCoverButton.tap()
        let dismissFullScreenCoverButton = app/*@START_MENU_TOKEN@*/.buttons["LockedFullScreenCover"]/*[[".buttons[\"Dismiss Full Screen Cover\"]",".buttons[\"LockedFullScreenCover\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

        XCTAssertTrue(dismissFullScreenCoverButton.exists)
    }
}
