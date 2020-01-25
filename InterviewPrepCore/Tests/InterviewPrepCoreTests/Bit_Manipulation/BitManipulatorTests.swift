//
// Created by Zach Miller on 25/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class BitManipulatorTests: XCTestCase {
}

// Test Cases for Get Bit Value
extension BitManipulatorTests {
    func test_GetBitValue_True() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 4

        // When
        let computedResult = bitManipulator.getBitValue(atIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_GetBitValue_False() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 5

        // When
        let computedResult = bitManipulator.getBitValue(atIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertFalse(computedResult)
    }
}