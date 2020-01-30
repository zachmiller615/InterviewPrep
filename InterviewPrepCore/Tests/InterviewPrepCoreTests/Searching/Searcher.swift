//
// Created by Zach Miller on 30/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class SearcherTests: XCTestCase {
}

// Test Cases for Binary Search Iterative
extension SearcherTests {
    func test_BinarySearchIterative_BasicCase() {
        // Given
        let searcher = Searcher()
        let sortedArray = [1, 2, 3, 4, 5, 6, 7]
        let target = 6
        let expectedResult = 5

        // When
        let computedResult = searcher.binarySearchIterative(sortedArray: sortedArray, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_BinarySearchIterative_NilCase() {
        // Given
        let searcher = Searcher()
        let sortedArray = [1, 2, 3, 4, 5, 6, 7]
        let target = 8

        // When
        let computedResult = searcher.binarySearchIterative(sortedArray: sortedArray, target: target)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_BinarySearchRecursive() {
        // Given
        let searcher = Searcher()
        let sortedArray = [1, 2, 3, 4, 5, 6, 7]
        let target = 6
        let expectedResult = 5

        // When
        let computedResult = searcher.binarySearchRecursive(sortedArray: sortedArray, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_BinarySearchRecursive_NilCase() {
        // Given
        let searcher = Searcher()
        let sortedArray = [1, 2, 3, 4, 5, 6, 7]
        let target = 8

        // When
        let computedResult = searcher.binarySearchRecursive(sortedArray: sortedArray, target: target)

        // Then
        XCTAssertNil(computedResult)
    }
}