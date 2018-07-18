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
    
    func testNavigation() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
//        let expect = XCTestExpectation(description: "Api Call")
        
//        NewsViewModel().getNewsList(successCompletion: { (model) in
//            expect.fulfill()
//            XCTAssert(true, "success")
//            XCTAssertGreaterThan(model.count, 0, ErrorMessage.NoNewsFound)
//        }) { (error) in
//            expect.fulfill()
//            XCTAssert(false, error)
//        }
//        wait(for: [expect], timeout: 20)
        let collectionview = XCUIApplication().collectionViews["News"]
        let success = collectionview.waitForExistence(timeout: 240)

        XCTAssert(success, "Fail to Find Collection View")
        snapshot("News List")   // Taking screen shot for news list
        
        let numberofCell = collectionview.cells.matching(identifier: "NewsInfoCollectionViewCell").count
        
        for i in 0..<numberofCell{
            collectionview.cells.element(boundBy: i).tap()
            snapshot("Details cell \(i)") // Taking screen shot for Details
            if i != numberofCell - 1{
                app.navigationBars.buttons.element(boundBy: 0).tap()
            }
        }
        

        let tableview = XCUIApplication().tables["tableview"]
        tableview.cells.element(boundBy: tableview.cells.count - 1).tap()
        
//        let lbl = XCUIApplication().staticTexts.element(matching: .any, identifier: "link")
//        lbl.tap()
        
        let webView =  XCUIApplication().webViews["webView"]
        _ = webView.waitForExistence(timeout: 20)
        snapshot("Link")
    }
    
}


extension XCTestCase {
    func snapshot(_ name: String) {
        print("snapshot: \(name)")
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let screenshotPath = documentDirectory.appendingPathComponent("Screenshots", isDirectory: true)
        if !FileManager.default.fileExists(atPath: screenshotPath.absoluteString){
            do{
                try FileManager.default.createDirectory(at: screenshotPath, withIntermediateDirectories: true, attributes: nil)
            }
            catch (let error){
                print(error.localizedDescription)
            }
        }
        print(screenshotPath)
        sleep(2) // Waiting for the animation to be finished (kind of)
        let screenshot = XCUIApplication().windows.firstMatch.screenshot()
        guard let simulator = ProcessInfo().environment["SIMULATOR_DEVICE_NAME"] else { return }
        let path = screenshotPath.appendingPathComponent("\(simulator)-\(name).png")
        do {
            try screenshot.pngRepresentation.write(to: path)
        } catch let error {
            print("Problem writing screenshot: \(name) to \(path)")
            print(error)
        }
    }
    
    func createSnapShotFolder() {
        
    }
}
