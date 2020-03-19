//
// Created by Zach Miller on 19/03/2020.
//

import XCTest
@testable import InterviewPrepCore

class OneAwayCheckerTests: XCTestCase {
}

// Test Cases for Strings Are At Most One Edit Away
extension OneAwayCheckerTests {
    func test_StringsAreAtMostOneEditAway_True_OneInsert() {
        // Given
        let string1 = "ple"
        let string2 = "pale"
        let checker = OneAwayChecker(string1: string1, string2: string2)

        // When
        let computedResult = checker.stringsAreAtMostOneEditAway()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_StringsAreAtMostOneEditAway_True_OneRemove() {
        // Given
        let string1 = "pales"
        let string2 = "pale"
        let checker = OneAwayChecker(string1: string1, string2: string2)

        // When
        let computedResult = checker.stringsAreAtMostOneEditAway()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_StringsAreAtMostOneEditAway_True_OneUpdate() {
        // Given
        let string1 = "pale"
        let string2 = "bale"
        let checker = OneAwayChecker(string1: string1, string2: string2)

        // When
        let computedResult = checker.stringsAreAtMostOneEditAway()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_StringsAreAtMostOneEditAway_False_TwoUpdates() {
        // Given
        let string1 = "pale"
        let string2 = "bake"
        let checker = OneAwayChecker(string1: string1, string2: string2)

        // When
        let computedResult = checker.stringsAreAtMostOneEditAway()

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_StringsAreAtMostOneEditAway_False_OneInsertOneUpdate() {
        // Given
        let string1 = "pales"
        let string2 = "palm"
        let checker = OneAwayChecker(string1: string1, string2: string2)

        // When
        let computedResult = checker.stringsAreAtMostOneEditAway()

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_StringsAreAtMostOneEditAway_False_LargeLengthDifference() {
        // Given
        let string1 = "go"
        let string2 = "going"
        let checker = OneAwayChecker(string1: string1, string2: string2)

        // When
        let computedResult = checker.stringsAreAtMostOneEditAway()

        // Then
        XCTAssertFalse(computedResult)
    }
}
