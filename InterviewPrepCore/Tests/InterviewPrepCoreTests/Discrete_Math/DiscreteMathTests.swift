//
// Created by Zach Miller on 18/02/2020.
//

import XCTest
@testable import InterviewPrepCore

class DiscreteMathTests: XCTestCase {
}

// Test Cases for Power Set
extension DiscreteMathTests {
    func test_PowerSet_InputSize0() {
        // Given
        let discreteMath = DiscreteMath()
        let superSet: Set<Int> = []
        let expectedResult: Set<Set<Int>> = [[]]

        // When
        let computedResult = discreteMath.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize1() {
        // Given
        let discreteMath = DiscreteMath()
        let superSet: Set<Int> = [1]
        let expectedResult: Set<Set<Int>> = [[], [1]]

        // When
        let computedResult = discreteMath.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize2() {
        // Given
        let discreteMath = DiscreteMath()
        let superSet: Set<Int> = [1, 2]
        let expectedResult: Set<Set<Int>> = [[], [1], [2], [1, 2]]

        // When
        let computedResult = discreteMath.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize3() {
        // Given
        let discreteMath = DiscreteMath()
        let superSet: Set<Int> = [1, 2, 3]
        let expectedResult: Set<Set<Int>> = [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]

        // When
        let computedResult = discreteMath.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize4() {
        // Given
        let discreteMath = DiscreteMath()
        let superSet: Set<Int> = [1, 2, 3, 4]
        let expectedResult: Set<Set<Int>> = [[], [1], [2], [3], [4], [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]

        // When
        let computedResult = discreteMath.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_PowerSet_InputSize5() {
        // Given
        let discreteMath = DiscreteMath()
        let superSet: Set<Int> = [1, 2, 3, 4, 5]
        let expectedResult: Set<Set<Int>> = [[], [1], [2], [3], [4], [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4],
                                             [5], [1, 5], [2, 5], [3, 5], [4, 5], [1, 2, 5], [1, 3, 5], [1, 4, 5], [2, 3, 5], [2, 4, 5], [3, 4, 5], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5], [1, 2, 3, 4, 5]]

        // When
        let computedResult = discreteMath.powerSet(of: superSet)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Permutations
extension DiscreteMathTests {
    func test_Permutations_InputSize0() {
        // Given
        let discreteMath = DiscreteMath()
        let set: Set<Character> = []
        let expectedResult: [[Character]] = [[]]

        // When
        let computedResult = discreteMath.permutations(of: set)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Permutations_InputSize1() {
        // Given
        let discreteMath = DiscreteMath()
        let set: Set<Character> = ["a"]
        let expectedResult: [[Character]] = [["a"]]

        // When
        let computedResult = discreteMath.permutations(of: set)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Permutations_InputSize2() {
        // Given
        let discreteMath = DiscreteMath()
        let set: Set<Character> = ["a", "b"]
        let expectedResult: [[Character]] = [
            ["a", "b"],
            ["b", "a"]
        ]

        // When
        let computedResult = discreteMath.permutations(of: set)

        // Then
        XCTAssertEqual(Set(computedResult), Set(expectedResult))
    }

    func test_Permutations_InputSize3() {
        // Given
        let discreteMath = DiscreteMath()
        let set: Set<Character> = ["a", "b", "c"]
        let expectedResult: [[Character]] = [
            ["a", "b", "c"],
            ["a", "c", "b"],
            ["b", "a", "c"],
            ["b", "c", "a"],
            ["c", "a", "b"],
            ["c", "b", "a"]
        ]

        // When
        let computedResult = discreteMath.permutations(of: set)

        // Then
        XCTAssertEqual(Set(computedResult), Set(expectedResult))
    }

    func test_Permutations_InputSize4() {
        // Given
        let discreteMath = DiscreteMath()
        let set: Set<Character> = ["a", "b", "c", "d"]
        let expectedResult: [[Character]] = [
            ["d", "a", "b", "c"],
            ["a", "d", "b", "c"],
            ["a", "b", "d", "c"],
            ["a", "b", "c", "d"],
            ["d", "a", "c", "b"],
            ["a", "d", "c", "b"],
            ["a", "c", "d", "b"],
            ["a", "c", "b", "d"],
            ["d", "b", "a", "c"],
            ["b", "d", "a", "c"],
            ["b", "a", "d", "c"],
            ["b", "a", "c", "d"],
            ["d", "b", "c", "a"],
            ["b", "d", "c", "a"],
            ["b", "c", "d", "a"],
            ["b", "c", "a", "d"],
            ["d", "c", "a", "b"],
            ["c", "d", "a", "b"],
            ["c", "a", "d", "b"],
            ["c", "a", "b", "d"],
            ["d", "c", "b", "a"],
            ["c", "d", "b", "a"],
            ["c", "b", "d", "a"],
            ["c", "b", "a", "d"]
        ]

        // When
        let computedResult = discreteMath.permutations(of: set)

        // Then
        XCTAssertEqual(Set(computedResult), Set(expectedResult))
    }
}