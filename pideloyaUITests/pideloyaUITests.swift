//
//  pideloyaUITests.swift
//  pideloyaUITests
//
//  Created by GSJ on 15/06/23.
//

import XCTest

class SearchAndScanViewTest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }

    func test_SearchAndScanView() throws {

        
        let app = XCUIApplication()
            app.launchArguments = ["isRunningUITests"]
            app.launch()

            let timeout = TimeInterval(5)
            let searchButton = app.navigationBars.links["searchButton"]
        
            XCTAssertTrue(searchButton.waitForExistence(timeout: timeout))
            searchButton.tap()

            let usernameInputField = app.textFields["usernameInputField"]
            let passwordInputField = app.textFields["passwordInputField"]
            let loginRequestButton = app.textFields["loginRequestButton"]

            XCTAssertTrue(usernameInputField.waitForExistence(timeout: timeout))
            XCTAssertTrue(passwordInputField.waitForExistence(timeout: timeout))
            XCTAssertTrue(loginRequestButton.waitForExistence(timeout: timeout))
            XCTAssertFalse(loginRequestButton.isEnabled)

            usernameInputField.tap()
            usernameInputField.typeText("tanaschita")

            passwordInputField.tap()
            passwordInputField.typeText("tanaschitasPassword1234!")

            XCTAssertTrue(loginRequestButton.isEnabled)

    }


}
