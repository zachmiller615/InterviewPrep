//
// Created by Zach Miller on 27/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class PrimeNumberCheckerTests: XCTestCase {
}

// Test Cases for Is Prime Naive Solution
extension PrimeNumberCheckerTests {
    func test_IsPrimeNaiveSolution_BasicCase_True() {
        // Given
        let primeNumberChecker = PrimeNumberChecker()
        let number = 23

        // When
        let computedResult = primeNumberChecker.isPrime_NaiveSolution(number: number)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_IsPrimeNaiveSolution_BasicCase_False() {
        // Given
        let primeNumberChecker = PrimeNumberChecker()
        let number = 24

        // When
        let computedResult = primeNumberChecker.isPrime_NaiveSolution(number: number)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_IsPrimeNaiveSolution_SpecialCase_True() {
        // Given
        let primeNumberChecker = PrimeNumberChecker()
        let number = 2

        // When
        let computedResult = primeNumberChecker.isPrime_NaiveSolution(number: number)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_IsPrimeNaiveSolution_SpecialCase_False() {
        // Given
        let primeNumberChecker = PrimeNumberChecker()
        let number = 1

        // When
        let computedResult = primeNumberChecker.isPrime_NaiveSolution(number: number)

        // Then
        XCTAssertFalse(computedResult)
    }
}