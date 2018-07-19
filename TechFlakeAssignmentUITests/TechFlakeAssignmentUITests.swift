//
//  TechFlakeAssignmentUITests.swift
//  TechFlakeAssignmentUITests
//
//  Created by Jayesh on 16/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import XCTest
import UIKit
@testable import TechFlakeAssignment


class TechFlakeAssignmentUITests: XCTestCase {
    
//    var objNewsViewModel : NewsViewModel?
    var app =  XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        
        XCUIApplication().launch()
        app.launchArguments.append("--uitesting")

//        objNewsViewModel = NewsViewModel()
        
        
        

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testnewsListandDetails() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // News List
        let collectionview = XCUIApplication().collectionViews["News"]
        let success = collectionview.waitForExistence(timeout: 240)
        XCTAssert(success, "Fail to Find Collection View")
        snapshot("News List")   // Taking screen shot for news list
        
        // News Detail
        let numberofCell = collectionview.cells.matching(identifier: "NewsInfoCollectionViewCell").count
        for i in 0..<numberofCell{
            collectionview.cells.element(boundBy: i).tap()
            snapshot("Details cell \(i)") // Taking screen shot for Details
            if i != numberofCell - 1{
                app.navigationBars.buttons.element(boundBy: 0).tap()
                collectionview.swipeUp()
                snapshot("News List \(i)")
            }
        }
        
        // WebView Details
        webviewScreenShot()
    }
    
    func webviewScreenShot() {
        let tableview = XCUIApplication().tables["tableview"]
        tableview.cells.element(boundBy: tableview.cells.count - 1).tap()
        let webView =  XCUIApplication().webViews["webView"]
        webView.waitForExistence(timeout: 20)
        snapshot("Link")
        
    }
}



