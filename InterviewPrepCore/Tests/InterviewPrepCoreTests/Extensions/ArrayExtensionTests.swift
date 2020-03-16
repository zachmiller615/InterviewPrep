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

// Test Cases for Swap Elements
extension ArrayExtensionTests {
    func test_SwapElements_BasicCase() {
        // Given
        var array = [1, 2]
        let expectedResult = [2, 1]

        // When
        array.swapElements(index1: 0, index2: 1)

        // Then
        XCTAssertEqual(array, expectedResult)
    }

    func test_SwapElements_InvalidIndices() {
        // Given
        var array = [1, 2]
        let expectedResult = [1, 2]

        // When
        array.swapElements(index1: 0, index2: 2)

        // Then
        XCTAssertEqual(array, expectedResult)
    }
}