//
//  HelloWorldiOSTests.swift
//  HelloWorldiOSTests
//
//  Created by Michele Fadda on 17/10/2022.
//

import XCTest
@testable import HelloWorldiOS

class HelloWorldiOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssert(2+2 == 4, "result != 4")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
