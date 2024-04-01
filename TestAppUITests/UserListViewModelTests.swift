//
//  UserListViewModelTests.swift
//  TestAppUITests
//
//  Created by Apple on 3/25/24.
//

import XCTest
@testable import TestApp

final class UserListViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIncrementPageCount() {
            let app = XCUIApplication()
            app.launch()
            let incrementButton = app.buttons["Next"]
            XCTAssertTrue(incrementButton.exists)
            incrementButton.tap()
        }

        func testDecrementPageCount() {
            let app = XCUIApplication()
            app.launch()
            let decrementButton = app.buttons["Previous"]
            XCTAssertTrue(decrementButton.exists)
            decrementButton.tap()
        }
}
