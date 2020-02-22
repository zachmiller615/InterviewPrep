//
// Created by Zach Miller on 22/02/2020.
//

import XCTest
@testable import InterviewPrepCore

class RecursionTests: XCTestCase {
}

// Test Cases for Multiply
extension RecursionTests {
    func test_Multiply_NilCase() {
        // Given
        let recursion = Recursion()
        let operand1 = -1
        let operand2 = -2

        // When
        let computedResult = recursion.multiply(positiveOperand1: operand1, positiveOperand2: operand2)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_Multiply_BasicCase() {
        // Given
        let recursion = Recursion()
        let operand1 = 5
        let operand2 = 3
        let expectedResult = 15

        // When
        let computedResult = recursion.multiply(positiveOperand1: operand1, positiveOperand2: operand2)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}