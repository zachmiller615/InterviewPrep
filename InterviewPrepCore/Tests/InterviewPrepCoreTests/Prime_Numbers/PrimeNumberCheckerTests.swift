//
// Created by Zach Miller on 27/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class PrimeNumberCheckerTests: XCTestCase {
}

// Test Cases for Number Is Prime
extension PrimeNumberCheckerTests {
    func test_NumberIsPrime_BasicCase_True() {
        // Given
        let primeNumberChecker = PrimeNumberChecker()
        let number = 23

        // When
        let computedResult = primeNumberChecker.numberIsPrime(number)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_NumberIsPrime_BasicCase_False() {
        // Given
        let primeNumberChecker = PrimeNumberChecker()
        let number = 24

        // When
        let computedResult = primeNumberChecker.numberIsPrime(number)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_NumberIsPrime_SpecialCase_True() {
        // Given
        let primeNumberChecker = PrimeNumberChecker()
        let number = 2

        // When
        let computedResult = primeNumberChecker.numberIsPrime(number)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_NumberIsPrime_SpecialCase_False() {
        // Given
        let primeNumberChecker = PrimeNumberChecker()
        let number = 1

        // When
        let computedResult = primeNumberChecker.numberIsPrime(number)

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Sieve of Eratosthenes
extension PrimeNumberCheckerTests {
    func test_SieveOfEratosthenes() {
        // Given
        let primeNumberChecker = PrimeNumberChecker()
        let max = 25
        let expectedResult = [false, false, true, true, false, true, false, true, false, false, false, true, false, true, false, false, false, true, false, true, false, false, false, true, false, false]

        // When
        let computedResult = primeNumberChecker.sieveOfEratosthenes(max: max)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}