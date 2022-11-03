//
//  SwiftUI_Lecture4_SFSymbolsUITestsLaunchTests.swift
//  SwiftUI_Lecture4_SFSymbolsUITests
//
//  Created by powerapp on 2022/11/04.
//

import XCTest

final class SwiftUI_Lecture4_SFSymbolsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
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
