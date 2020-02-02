//
// Created by Zach Miller on 23/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class StringExtensionTests: XCTestCase {
}

// Test Cases for Contains Unique Characters
extension StringExtensionTests {
    func test_ContainsUniqueCharacters_True() {
        // Given
        let string = "ABCDEFGH"

        // When
        let computedResult = string.containsUniqueCharacters()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_ContainsUniqueCharacters_False() {
        // Given
        let string = "ABCDEFGA"

        // When
        let computedResult = string.containsUniqueCharacters()

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Is Permutation
extension StringExtensionTests {
    func test_IsPermutation_True() {
        // Given
        let string = "excellent"
        let otherString = "lecnexlet"

        // When
        let computedResult = string.isPermutation(of: otherString)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_Permutation_False() {
        // Given
        let string = "excellent"
        let otherString = "lecnexlea"

        // When
        let computedResult = string.isPermutation(of: otherString)

        // Then
        XCTAssertFalse(computedResult)
    }
}