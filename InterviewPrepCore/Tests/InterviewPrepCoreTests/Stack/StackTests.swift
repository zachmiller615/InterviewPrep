//
// Created by Zach Miller on 20/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class StackTests: XCTestCase {
    // Properties
    private let emptyStack = Stack<Int>()
    private var fullStack: Stack<Int>!

    // Methods
    override func setUp() {
        super.setUp()
        self.fillStack()
    }

    override func tearDown() {
        self.fullStack = nil
        super.tearDown()
    }

    // Private Methods
    private func fillStack() {
        self.fullStack = Stack()
        self.fullStack.push(1)
        self.fullStack.push(2)
        self.fullStack.push(3)
        self.fullStack.push(4)
        self.fullStack.push(5)
    }
}

// Test Cases for Is Empty
extension StackTests {
    func test_IsEmpty_True() {
        // When
        let computedResult = self.emptyStack.isEmpty()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_IsEmpty_False() {
        // When
        let computedResult = self.fullStack.isEmpty()

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Pop
extension StackTests {
    func test_Pop_BasicCase() {
        // When
        let firstPop = self.fullStack.pop()
        let secondPop = self.fullStack.pop()

        // Then
        XCTAssertEqual(firstPop, 5)
        XCTAssertEqual(secondPop, 4)
    }

    func test_Pop_NilCase() {
        // When
        let computedResult = self.emptyStack.pop()

        // Then
        XCTAssertNil(computedResult)
    }
}

// Test Cases for Peek
extension StackTests {
    func test_Peek_BasicCase() {
        // When
        let firstPeek = self.fullStack.peek()
        let secondPeek = self.fullStack.peek()

        // Then
        XCTAssertEqual(firstPeek, 5)
        XCTAssertEqual(secondPeek, 5)
    }

    func test_Peek_NilCase() {
        // When
        let computedResult = self.emptyStack.peek()

        // Then
        XCTAssertNil(computedResult)
    }
}