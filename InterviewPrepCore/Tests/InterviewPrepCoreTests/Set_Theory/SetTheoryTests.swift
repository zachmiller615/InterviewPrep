//
// Created by Zach Miller on 18/02/2020.
//

import XCTest
@testable import InterviewPrepCore

class SetTheoryTests: XCTestCase {
}

// Test Cases for Power Set
extension SetTheoryTests {
    func test_PowerSet_InputSize0() {
        // Given
        let setTheory = SetTheory()
        let superSet: Set<Int> = []
        let expectedResult: Set<Set<Int>> = [[]]

        // When
        let computedResult = setTheory.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize1() {
        // Given
        let setTheory = SetTheory()
        let superSet: Set<Int> = [1]
        let expectedResult: Set<Set<Int>> = [[], [1]]

        // When
        let computedResult = setTheory.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize2() {
        // Given
        let setTheory = SetTheory()
        let superSet: Set<Int> = [1, 2]
        let expectedResult: Set<Set<Int>> = [[], [1], [2], [1, 2]]

        // When
        let computedResult = setTheory.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize3() {
        // Given
        let setTheory = SetTheory()
        let superSet: Set<Int> = [1, 2, 3]
        let expectedResult: Set<Set<Int>> = [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]

        // When
        let computedResult = setTheory.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize4() {
        // Given
        let setTheory = SetTheory()
        let superSet: Set<Int> = [1, 2, 3, 4]
        let expectedResult: Set<Set<Int>> = [[], [1], [2], [3], [4], [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]

        // When
        let computedResult = setTheory.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize5() {
        // Given
        let setTheory = SetTheory()
        let superSet: Set<Int> = [1, 2, 3, 4, 5]
        let expectedResult: Set<Set<Int>> = [[], [1], [2], [3], [4], [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4],
                                             [5], [1, 5], [2, 5], [3, 5], [4, 5], [1, 2, 5], [1, 3, 5], [1, 4, 5], [2, 3, 5], [2, 4, 5], [3, 4, 5], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5], [1, 2, 3, 4, 5]]

        // When
        let computedResult = setTheory.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}