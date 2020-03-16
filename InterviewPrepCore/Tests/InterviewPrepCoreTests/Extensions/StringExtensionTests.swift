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

    func test_IsPermutation_False_SameLength() {
        // Given
        let string = "excellent"
        let otherString = "lecnexlea"

        // When
        let computedResult = string.isPermutation(of: otherString)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_IsPermutation_False_DifferentLength() {
        // Given
        let string = "excellent"
        let otherString = "lecnexleta"

        // When
        let computedResult = string.isPermutation(of: otherString)

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Replace Spaces With Percent 20
extension StringExtensionTests {
    func test_ReplaceSpacesWithPercent20() {
        // Given
        var string = "Mr John Smith    "
        let expectedResult = "Mr%20John%20Smith"

        // When
        string.replaceSpacesWithPercent20(trueLength: 13)

        // Then
        XCTAssertEqual(string, expectedResult)
    }
}

// Test Cases for Is Permutation of Palindrome
extension StringExtensionTests {
    func test_IsPermutationOfPalindrome_True_EvenCount() {
        // Given
        let string = "abab"

        // When
        let computedResult = string.isPermutationOfPalindrome()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_IsPermutationOfPalindrome_True_OddCount() {
        // Given
        let string = "tactcoa"

        // When
        let computedResult = string.isPermutationOfPalindrome()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_IsPermutationOfPalindrome_False() {
        // Given
        let string = "abcabd"

        // When
        let computedResult = string.isPermutationOfPalindrome()

        // Then
        XCTAssertFalse(computedResult)
    }
}