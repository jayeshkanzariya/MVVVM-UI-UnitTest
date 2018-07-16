//
//  TechFlakeAssignmentUITests.swift
//  TechFlakeAssignmentUITests
//
//  Created by Jayesh on 16/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import XCTest
@testable import TechFlakeAssignment


class TechFlakeAssignmentUITests: XCTestCase {
    
//    var newsList : NewsViewModel?
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        newsList = NewsViewModel()
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
                        
        addUIInterruptionMonitor(withDescription: "") { (<#XCUIElement#>) -> Bool in
            <#code#>
        }
    }
    
}
