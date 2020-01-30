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

// Test Cases for Counting Sort
extension SorterTests {
    func test_CountingSort_BasicCase() {
        // Given
        let sorter = Sorter()
        let array = [6, 2, 4, 1, 5, 7, 3, 8, 0, 9, 3, 5, 7, 3]
        let expectedResult = [0, 1, 2, 3, 3, 3, 4, 5, 5, 6, 7, 7, 8, 9]

        // When
        let computedResult = sorter.countingSort(array: array, keyExtractor: { $0 }, keyRange: (0...9))

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_CountingSort_InputElementTooLarge() {
        // Given
        let sorter = Sorter()
        let array = [8, 0, 9, 3, 5, 7, 3, 10]

        // When
        let computedResult = sorter.countingSort(array: array, keyExtractor: { $0 }, keyRange: (0...9))

        // Then
        XCTAssertNil(computedResult)
    }

    func test_CountingSort_InputElementTooSmall() {
        // Given
        let sorter = Sorter()
        let array = [8, 0, 9, 3, 5, 7, 3, -1]

        // When
        let computedResult = sorter.countingSort(array: array, keyExtractor: { $0 }, keyRange: (0...9))

        // Then
        XCTAssertNil(computedResult)
    }

    func test_CountingSort_ElementRangeOffsetFromZero() {
        // Given
        let sorter = Sorter()
        let array = [17, 21, 10, 25]
        let expectedResult = [10, 17, 21, 25]

        // When
        let computedResult = sorter.countingSort(array: array, keyExtractor: { $0 }, keyRange: (10...25))

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_CountingSort_KeyExtractor() {
        // Given
        let sorter = Sorter()
        let array = [Person(name: "Zach", age: 27), Person(name: "Eitan", age: 26), Person(name: "Sydney", age: 24), Person(name: "Shoshi", age: 22), Person(name: "Zoe", age: 15)]
        let expectedResult = [Person(name: "Zoe", age: 15), Person(name: "Shoshi", age: 22), Person(name: "Sydney", age: 24), Person(name: "Eitan", age: 26), Person(name: "Zach", age: 27)]

        // When
        let computedResult = sorter.countingSort(array: array, keyExtractor: { $0.age }, keyRange: (15...27))

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_CountingSort_Stability() {
        // Given
        let sorter = Sorter()
        let array = [Person(name: "Zach", age: 27),
                     Person(name: "Eitan", age: 26),
                     Person(name: "Alice", age: 27),
                     Person(name: "Sydney", age: 24),
                     Person(name: "Bob", age: 26),
                     Person(name: "Shoshi", age: 22),
                     Person(name: "Abe", age: 24),
                     Person(name: "Zoe", age: 15)]
        let expectedResult = [Person(name: "Zoe", age: 15),
                              Person(name: "Shoshi", age: 22),
                              Person(name: "Sydney", age: 24),
                              Person(name: "Abe", age: 24),
                              Person(name: "Eitan", age: 26),
                              Person(name: "Bob", age: 26),
                              Person(name: "Zach", age: 27),
                              Person(name: "Alice", age: 27)]

        // When
        let computedResult = sorter.countingSort(array: array, keyExtractor: { $0.age }, keyRange: (15...27))

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_CountingSort_NegativeNumbers() {
        // Given
        let sorter = Sorter()
        let array = [-17, -21, -10, -25]
        let expectedResult = [-25, -21, -17, -10]

        // When
        let computedResult = sorter.countingSort(array: array, keyExtractor: { $0 }, keyRange: ((-25)...(-10)))

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}