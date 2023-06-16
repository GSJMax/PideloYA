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
        
        let timeout = TimeInterval(20)
        let searchButton = app.otherElements.buttons["searchButton"]
        
        XCTAssertTrue(searchButton.waitForExistence(timeout: timeout))
        searchButton.tap()
        
        let userInputSearch = app.textFields["searchTextField"]
        XCTAssertTrue(userInputSearch.waitForExistence(timeout: timeout))
        XCTAssertFalse(searchButton.isEnabled)
        
        userInputSearch.tap()
        userInputSearch.typeText("Laptop Lenovo")
        XCTAssertTrue(searchButton.isEnabled)
        
    }
}
