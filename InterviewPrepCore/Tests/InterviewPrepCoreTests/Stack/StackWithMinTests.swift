//
// Created by Zach Miller on 02/02/2020.
//

import XCTest
@testable import InterviewPrepCore

class StackWithMinTests: XCTestCase {
}

// Test Cases for Min
extension StackWithMinTests {
    func test_Min() {
        let stack = StackWithMin<Int>()
        XCTAssertNil(stack.min())
        stack.push(15)
        XCTAssertEqual(stack.min(), 15)
        stack.push(30)
        XCTAssertEqual(stack.min(), 15)
        stack.push(5)
        XCTAssertEqual(stack.min(), 5)
        stack.push(40)
        XCTAssertEqual(stack.min(), 5)
        stack.push(4)
        XCTAssertEqual(stack.min(), 4)
        stack.push(20)
        XCTAssertEqual(stack.min(), 4)
        stack.push(3)
        XCTAssertEqual(stack.min(), 3)
        stack.pop()
        XCTAssertEqual(stack.min(), 4)
        stack.pop()
        XCTAssertEqual(stack.min(), 4)
        stack.pop()
        XCTAssertEqual(stack.min(), 5)
        stack.pop()
        XCTAssertEqual(stack.min(), 5)
        stack.pop()
        XCTAssertEqual(stack.min(), 15)
        stack.pop()
        XCTAssertEqual(stack.min(), 15)
        stack.pop()
        XCTAssertNil(stack.min())
    }
}