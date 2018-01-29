//
//  RetailStoreTests.swift
//  RetailStoreTests
//
//  Created by Aravind on 14/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import XCTest
@testable import RetailStore

class RetailStoreTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCategoriesViewModelCount() {
        let viewModel = CategoriesViewModel()
        viewModel.getCategories()
        XCTAssertEqual(viewModel.categories.count, 2, "Catogries count should be 2")
        // For failure scenario
       // XCTAssertEqual(viewModel.catogries.count, 1, "Catogries count should be 2")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testCategoriesViewModelSections() {
        let viewModel = CategoriesViewModel()
        viewModel.getCategories()
        XCTAssertEqual(viewModel.numberOfItemsInSection(0),2,"Number of sections should be 2")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testProductsListViewModelCount() {
        let viewModel = ProductsListViewModel()
        viewModel.getProducts()
        XCTAssertEqual(viewModel.productList.count, 2, "Product count should be 2")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
