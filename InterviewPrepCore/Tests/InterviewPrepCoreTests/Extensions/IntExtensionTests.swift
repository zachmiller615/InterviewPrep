//
// Created by Zach Miller on 16/03/2020.
//

import XCTest
@testable import InterviewPrepCore

class IntExtensionTests: XCTestCase {
}

// Test Cases for Get Digit Value
extension IntExtensionTests {
    func test_GetDigitValue_BasicCase() {
        // Given
        let number = 1200
        let offset = 2
        let expectedResult = 2

        // When
        let computedResult = number.getDigitValue(offsetFromOnesPlace: offset)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_GetDigitValue_NegativeOffset() {
        // Given
        let number = 1200
        let offset = -1

        // When
        let computedResult = number.getDigitValue(offsetFromOnesPlace: offset)

        // Then
        XCTAssertNil(computedResult)
    }
}
