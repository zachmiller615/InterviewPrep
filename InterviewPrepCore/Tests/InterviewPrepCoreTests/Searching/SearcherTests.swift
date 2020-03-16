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
        let target = 5
        let expectedResult = 4

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
}

// Test Cases for Binary Search Iterative
extension SearcherTests {
    func test_BinarySearchRecursive_BasicCase() {
        // Given
        let searcher = Searcher()
        let sortedArray = [1, 2, 3, 4, 5, 6, 7]
        let target = 5
        let expectedResult = 4

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

// Test Cases for Search In Rotated Array
extension SearcherTests {
    func test_SearchInRotatedArray_NilCase() {
        // Given
        let searcher = Searcher()
        let array = [20, 25, 1, 3, 4, 5, 7, 10]
        let target = 30

        // When
        let computedResult = searcher.searchInRotatedArray(array, target: target)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_SearchInRotatedArray_RotationPointIsLeft_TargetIsLeft() {
        // Given
        let searcher = Searcher()
        let array = [20, 25, 1, 3, 4, 5, 7, 10]
        let target = 25
        let expectedResult = 1

        // When
        let computedResult = searcher.searchInRotatedArray(array, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_SearchInRotatedArray_RotationPointIsLeft_TargetIsRight() {
        // Given
        let searcher = Searcher()
        let array = [20, 25, 1, 3, 4, 5, 7, 10]
        let target = 7
        let expectedResult = 6

        // When
        let computedResult = searcher.searchInRotatedArray(array, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_SearchInRotatedArray_RotationPointIsRight_TargetIsLeft() {
        // Given
        let searcher = Searcher()
        let array = [15, 16, 19, 20, 25, 1, 3]
        let target = 19
        let expectedResult = 2

        // When
        let computedResult = searcher.searchInRotatedArray(array, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_SearchInRotatedArray_RotationPointIsRight_TargetIsRight() {
        // Given
        let searcher = Searcher()
        let array = [15, 16, 19, 20, 25, 1, 3]
        let target = 3
        let expectedResult = 6

        // When
        let computedResult = searcher.searchInRotatedArray(array, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_SearchInRotatedArray_RotationPointIsCenter_TargetIsLeft() {
        // Given
        let searcher = Searcher()
        let array = [15, 20, 25, 1, 3, 4, 5]
        let target = 25
        let expectedResult = 2

        // When
        let computedResult = searcher.searchInRotatedArray(array, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_SearchInRotatedArray_RotationPointIsCenter_TargetIsRight() {
        // Given
        let searcher = Searcher()
        let array = [15, 20, 25, 1, 3, 4, 5]
        let target = 3
        let expectedResult = 4

        // When
        let computedResult = searcher.searchInRotatedArray(array, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_SearchInRotatedArray_LeftSideAllDuplicates() {
        // Given
        let searcher = Searcher()
        let array = [2, 2, 2, 3, 4, 2]
        let target = 3
        let expectedResult = 3

        // When
        let computedResult = searcher.searchInRotatedArray(array, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_SearchInRotatedArray_RightSideAllDuplicates() {
        // Given
        let searcher = Searcher()
        let array = [5, 3, 4, 5, 5, 5]
        let target = 3
        let expectedResult = 1

        // When
        let computedResult = searcher.searchInRotatedArray(array, target: target)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Find Magic Index
extension SearcherTests {
    func test_FindMagicIndex_ExistsLeft() {
        // Given
        let searcher = Searcher()
        let sortedArray = [-1, 1, 3, 4, 5]
        let expectedResult = 1

        // When
        let computedResult = searcher.findMagicIndex(in: sortedArray)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_FindMagicIndex_ExistsRight() {
        // Given
        let searcher = Searcher()
        let sortedArray = [-1, 0, 1, 3, 5]
        let expectedResult = 3

        // When
        let computedResult = searcher.findMagicIndex(in: sortedArray)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_FindMagicIndex_DoesNotExist() {
        // Given
        let searcher = Searcher()
        let sortedArray = [5, 6, 7, 8, 9]

        // When
        let computedResult = searcher.findMagicIndex(in: sortedArray)

        // Then
        XCTAssertNil(computedResult)
    }
}