//
// Created by Zach Miller on 16/02/2020.
//

import XCTest
@testable import InterviewPrepCore

class ArrayMergerTests: XCTestCase {
}

// Test Cases for Combinations Keeping Respective Orders
extension ArrayMergerTests {
    func test_CombinationsKeepingRespectiveOrders_EmptyInput() {
        // Given
        let arrayMerger = ArrayMerger()
        let array1: [Int] = []
        let array2: [Int] = []
        let expectedResult: [[Int]] = []

        // When
        let computedResult = arrayMerger.combinationsKeepingRespectiveOrders(array1: array1, array2: array2)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_CombinationsKeepingRespectiveOrders_Array2Empty() {
        // Given
        let arrayMerger = ArrayMerger()
        let array1: [Int] = [1]
        let array2: [Int] = []
        let expectedResult: [[Int]] = [[1]]

        // When
        let computedResult = arrayMerger.combinationsKeepingRespectiveOrders(array1: array1, array2: array2)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_CombinationsKeepingRespectiveOrders_Array1Empty() {
        // Given
        let arrayMerger = ArrayMerger()
        let array1: [Int] = []
        let array2: [Int] = [1]
        let expectedResult: [[Int]] = [[1]]

        // When
        let computedResult = arrayMerger.combinationsKeepingRespectiveOrders(array1: array1, array2: array2)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_CombinationsKeepingRespectiveOrders_SingleElementInputs() {
        // Given
        let arrayMerger = ArrayMerger()
        let array1: [Int] = [1]
        let array2: [Int] = [2]
        let expectedResult: [[Int]] = [[1, 2], [2, 1]]

        // When
        let computedResult = arrayMerger.combinationsKeepingRespectiveOrders(array1: array1, array2: array2)

        // Then
        XCTAssertEqual(Set(computedResult), Set(expectedResult))
    }

    func test_CombinationsKeepingRespectiveOrders_OneInputHasMultipleElements() {
        // Given
        let arrayMerger = ArrayMerger()
        let array1: [Int] = [1, 2]
        let array2: [Int] = [3]
        let expectedResult: [[Int]] = [[3, 1, 2], [1, 3, 2], [1, 2, 3]]

        // When
        let computedResult = arrayMerger.combinationsKeepingRespectiveOrders(array1: array1, array2: array2)

        // Then
        XCTAssertEqual(Set(computedResult), Set(expectedResult))
    }

    func test_CombinationsKeepingRespectiveOrders_BothInputsHaveMultipleElements() {
        // Given
        let arrayMerger = ArrayMerger()
        let array1: [Int] = [1, 2]
        let array2: [Int] = [3, 4]
        let expectedResult: [[Int]] = [[1, 2, 3, 4], [1, 3, 2, 4], [1, 3, 4, 2], [3, 1, 2, 4], [3, 1, 4, 2], [3, 4, 1, 2]]

        // When
        let computedResult = arrayMerger.combinationsKeepingRespectiveOrders(array1: array1, array2: array2)

        // Then
        XCTAssertEqual(Set(computedResult), Set(expectedResult))
    }
}