//
//  RecipeUITestsLaunchTests.swift
//  RecipeUITests
//
//  Created by Nandkishore on 10/7/24.
//

import XCTest

final class RecipeUITestsLaunchTests: XCTestCase {

    let app = XCUIApplication()
    let device = XCUIDevice.shared
    
    // Test login button tap
    func testLogInTapAndViewControllerLaunch() throws {
        app.launch()
        app.buttons["Get Recipe"].tap()
        device.orientation = UIDeviceOrientation.portrait
    }
    
    // Test to go to next screen and back button tap on it
    func testGoToNextScreenAndBackButtonTap() throws {
        app.launch()
        app.buttons["Get Recipe"].tap()
        sleep(1)
        app.buttons["Back"].tap()
        
        device.orientation = UIDeviceOrientation.portrait
    }
    
    // Test to go to details screen and back button tap
    func testGoToDetailsScreenAndTapBackButton() throws {
        app.launch()
        app.buttons["Get Recipe"].tap()
        
        sleep(1)
        
        let cellQuery = self.app.tables.cells.element(boundBy: 2)
        cellQuery.tap()
        
        // On Details
        app.buttons["Back"].tap()
        
        // On recipe
        app.buttons["Back"].tap()
        
        device.orientation = UIDeviceOrientation.portrait
    }
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        false
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
