
//
//  XCTextCaseExtension.swift
//  TechFlakeAssignmentUITests
//
//  Created by Jayesh on 19/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import XCTest

extension XCTestCase {
    func snapshot(_ name: String) {
        if let url = createSnapShotFolder(){
            sleep(2) // Waiting for the animation to be finished (kind of)
            let screenshot = XCUIApplication().windows.firstMatch.screenshot()
            guard let simulator = ProcessInfo().environment["SIMULATOR_DEVICE_NAME"] else { return }
            let path = url.appendingPathComponent("\(simulator)-\(name).png")
            do {
                try screenshot.pngRepresentation.write(to: path)
            } catch let error {
                print("Problem writing screenshot: \(name) to \(path)")
                print(error)
            }
        }
    }
    
    func createSnapShotFolder() -> URL?{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let screenshotPath = documentDirectory.appendingPathComponent("Screenshots", isDirectory: true)
        print("screenshotPath\(screenshotPath)")
        if !FileManager.default.fileExists(atPath: screenshotPath.absoluteString){
            do{
                try FileManager.default.createDirectory(at: screenshotPath, withIntermediateDirectories: true, attributes: nil)
                return screenshotPath
            }
            catch (let error){
                print(error.localizedDescription)
                return nil
            }
        }
        else{
            return screenshotPath
        }
    }
}
