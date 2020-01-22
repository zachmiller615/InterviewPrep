//
// Created by Zach Miller on 22/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class HeapTests: XCTestCase {
}

// Test Cases for Peek
extension HeapTests {
    func test_Peek_NilCase() {
        // Given
        let heap = Heap<Int>(type: .min)

        // When
        let computedResult = heap.peek()

        // Then
        XCTAssertNil(computedResult)
    }

    func test_Peek_BasicCase() {
        // Given
        let heap = Heap<Int>(type: .min)
        let expectedResult = 10
        heap.add(expectedResult)

        // When
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Case for Add
extension HeapTests {
    func test_Add_ChangeMin() {
        // Given
        let heap = Heap<Int>(type: .min)
        heap.add(10)
        let expectedResult = 5

        // When
        heap.add(expectedResult)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}



















































