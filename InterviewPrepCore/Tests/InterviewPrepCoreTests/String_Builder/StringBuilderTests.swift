//
// Created by Zach Miller on 23/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class StringBuilderTests: XCTestCase {
}

// Test Cases for Append
extension StringBuilderTests {
    func test_Append() {
        // Given
        var stringBuilder = StringBuilder()
        let expectedResult = "ABCDE"

        // When
        stringBuilder.append("A")
        stringBuilder.append("B")
        stringBuilder.append("C")
        stringBuilder.append("D")
        stringBuilder.append("E")
        let computedResult = stringBuilder.toString()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}