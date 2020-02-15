//
// Created by Zach Miller on 15/02/2020.
//

import XCTest
@testable import InterviewPrepCore

class ListyTests: XCTestCase {
}

// Test Cases for Index Of Element
extension ListyTests {
    func test_IndexOfElement_ExistsRight() {
        // Given
        let listy = Listy(data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        let targetElement = 10
        let expectedResult = 9

        // When
        let computedResult = listy.indexOfElement(targetElement)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_IndexOfElement_ExistsLeft() {
        // Given
        let listy = Listy(data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        let targetElement = 2
        let expectedResult = 1

        // When
        let computedResult = listy.indexOfElement(targetElement)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_IndexOfElement_DoesNotExist() {
        // Given
        let listy = Listy(data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        let targetElement = 11

        // When
        let computedResult = listy.indexOfElement(targetElement)

        // Then
        XCTAssertNil(computedResult)
    }
}