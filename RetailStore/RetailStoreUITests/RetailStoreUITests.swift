//
//  RetailStoreUITests.swift
//  RetailStoreUITests
//
//  Created by Aravind on 14/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import XCTest

class RetailStoreUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
      
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRetailStore() {
        
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Electronics"]/*[[".cells.staticTexts[\"Electronics\"]",".staticTexts[\"Electronics\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let cellsQuery = collectionViewsQuery.cells
        cellsQuery.otherElements.containing(.staticText, identifier:"Microwave oven").children(matching: .other).element.tap()
        
        let addToCartButton = app.buttons["Add to cart"]
        addToCartButton.tap()
        
        let productAddedToCartSuccessfullyAlert = app.alerts["Product added to cart successfully"]
        let okButton = productAddedToCartSuccessfullyAlert.buttons["OK"]
        okButton.tap()
        
        let retailStoreNavigationBar = app.navigationBars["Retail Store"]
        let electronicsButton = retailStoreNavigationBar.buttons["Electronics"]
        electronicsButton.tap()
        cellsQuery.otherElements.containing(.staticText, identifier:"Television").children(matching: .other).element.tap()
        addToCartButton.tap()
        productAddedToCartSuccessfullyAlert.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        okButton.tap()
        electronicsButton.tap()
        cellsQuery.otherElements.containing(.staticText, identifier:"Vacuum Cleaner").children(matching: .other).element.tap()
        addToCartButton.tap()
        okButton.tap()
        retailStoreNavigationBar.children(matching: .button).element(boundBy: 1).tap()
        app.tables/*@START_MENU_TOKEN@*/.cells.containing(.image, identifier:"icon_tv")/*[[".cells.containing(.staticText, identifier:\"₹30000\")",".cells.containing(.staticText, identifier:\"Television\")",".cells.containing(.image, identifier:\"icon_tv\")"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["icon delete"].tap()
        
    }
    
}
