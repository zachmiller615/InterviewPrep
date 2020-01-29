//
// Created by Zach Miller on 29/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class SorterTests: XCTestCase {
}

// Test Cases for Bubble Sort
extension SorterTests {
    func test_BubbleSort_BasicCase() {
        // Given
        let sorter = Sorter()
        let array = [6, 2, 4, 1, 5, 7, 3, 8]
        let expectedResult = [1, 2, 3, 4, 5, 6, 7, 8]

        // When
        let computedResult = sorter.bubbleSort(array)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_BubbleSort_InputReverselySorted() {
        // Given
        let sorter = Sorter()
        let array = [4, 3, 2, 1]
        let expectedResult = [1, 2, 3, 4]

        // When
        let computedResult = sorter.bubbleSort(array)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Selection Sort
extension SorterTests {
    func test_SelectionSort_BasicCase() {
        // Given
        let sorter = Sorter()
        let array = [6, 2, 4, 1, 5, 7, 3, 8]
        let expectedResult = [1, 2, 3, 4, 5, 6, 7, 8]

        // When
        let computedResult = sorter.selectionSort(array)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_SelectionSort_InputReverselySorted() {
        // Given
        let sorter = Sorter()
        let array = [4, 3, 2, 1]
        let expectedResult = [1, 2, 3, 4]

        // When
        let computedResult = sorter.selectionSort(array)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Merge Sort
extension SorterTests {
    func test_MergeSort_BasicCase() {
        // Given
        let sorter = Sorter()
        let array = [6, 2, 4, 1, 5, 7, 3, 8]
        let expectedResult = [1, 2, 3, 4, 5, 6, 7, 8]

        // When
        let computedResult = sorter.mergeSort(array)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_MergeSort_InputReverselySorted() {
        // Given
        let sorter = Sorter()
        let array = [4, 3, 2, 1]
        let expectedResult = [1, 2, 3, 4]

        // When
        let computedResult = sorter.mergeSort(array)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Quick Sort
extension SorterTests {
    func test_QuickSort_BasicCase() {
        // Given
        let sorter = Sorter()
        let array = [6, 2, 4, 1, 5, 7, 3, 8]
        let expectedResult = [1, 2, 3, 4, 5, 6, 7, 8]

        // When
        let computedResult = sorter.quickSort(array)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_QuickSort_InputReverselySorted() {
        // Given
        let sorter = Sorter()
        let array = [4, 3, 2, 1]
        let expectedResult = [1, 2, 3, 4]

        // When
        let computedResult = sorter.quickSort(array)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}