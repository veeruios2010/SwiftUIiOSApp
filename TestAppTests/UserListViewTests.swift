//
//  UserListViewTests.swift
//  TestAppTests
//
//  Created by Apple on 3/25/24.
//

import XCTest
@testable import TestApp
import SwiftUI

final class UserListViewTests: XCTestCase {

    
    @MainActor
    func testUserListView() {
        let viewModel = UserListViewModel()
        let contentView = UserListView(viewModel: viewModel)
        let view = UIHostingController(rootView: contentView).view // Wrap the ContentView in a UIHostingController
        
        XCTAssertNotNil(view) // Assert that the view is not nil
    }
    
    @MainActor
    func testpageIncrement() {
      let viewModel = UserListViewModel()
      viewModel.pageIncrement()
      XCTAssertEqual(viewModel.pageCount, 2)
    }

    @MainActor
    func testpageDecrement() {
      let viewModel = UserListViewModel()
      viewModel.pageDecrement()
      XCTAssertEqual(viewModel.pageCount, 0)
    }

    @MainActor
    func testIncrementAndDecrement() {
      let viewModel = UserListViewModel()
      viewModel.pageIncrement()
      viewModel.pageIncrement()
      viewModel.pageDecrement()
      XCTAssertEqual(viewModel.pageCount, 2)
    }
}

class MockViewModel: ObservableObject {
   
}
