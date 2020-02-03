//
// Created by Zach Miller on 03/02/2020.
//

import XCTest
@testable import InterviewPrepCore

class ArrayExtensionTests: XCTestCase {
}

// Test Cases for Map Sort
extension ArrayExtensionTests {
    func test_MapSort() {
        // Given
        let array = ["binary", "adobe", "brainy", "abode", "hello"]
        let expectedResult = ["adobe", "abode", "binary", "brainy", "hello"]

        // When
        let computedResult = array.mapSort {
            String($0.sorted())
        }

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}