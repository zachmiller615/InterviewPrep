//
// Created by Zach Miller on 28/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class DynamicProgrammingTests: XCTestCase {
}

// Test Cases for Triple Step
extension DynamicProgrammingTests {
    func test_TripleStep_0_Steps() {
        // Given
        let dynamicProgramming = DynamicProgramming()
        let numberOfSteps = 0

        // When
        let computedResult = dynamicProgramming.tripleStep(numberOfSteps: numberOfSteps)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_TripleStep_1_Step() {
        // Given
        let dynamicProgramming = DynamicProgramming()
        let numberOfSteps = 1
        let expectedResult = 1

        // When
        let computedResult = dynamicProgramming.tripleStep(numberOfSteps: numberOfSteps)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_TripleStep_2_Steps() {
        // Given
        let dynamicProgramming = DynamicProgramming()
        let numberOfSteps = 2
        let expectedResult = 2

        // When
        let computedResult = dynamicProgramming.tripleStep(numberOfSteps: numberOfSteps)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_TripleStep_3_Steps() {
        // Given
        let dynamicProgramming = DynamicProgramming()
        let numberOfSteps = 3
        let expectedResult = 4

        // When
        let computedResult = dynamicProgramming.tripleStep(numberOfSteps: numberOfSteps)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_TripleStep_4_Steps() {
        // Given
        let dynamicProgramming = DynamicProgramming()
        let numberOfSteps = 4
        let expectedResult = 7

        // When
        let computedResult = dynamicProgramming.tripleStep(numberOfSteps: numberOfSteps)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_TripleStep_5_Steps() {
        // Given
        let dynamicProgramming = DynamicProgramming()
        let numberOfSteps = 5
        let expectedResult = 13

        // When
        let computedResult = dynamicProgramming.tripleStep(numberOfSteps: numberOfSteps)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_TripleStep_6_Steps() {
        // Given
        let dynamicProgramming = DynamicProgramming()
        let numberOfSteps = 6
        let expectedResult = 24

        // When
        let computedResult = dynamicProgramming.tripleStep(numberOfSteps: numberOfSteps)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}