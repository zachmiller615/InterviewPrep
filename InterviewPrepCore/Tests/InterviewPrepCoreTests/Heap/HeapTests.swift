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

    func test_Add_ChangeMinOneTime() {
        // Given
        let heap = Heap<Int>(type: .min)
        heap.add(10)
        heap.add(5)
        let expectedResult = 5

        // When
        heap.add(7)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Add_SwimUpTwoTimes_MinHeap() {
        // Given
        let heap = Heap<Int>(type: .min)
        heap.add(10)
        heap.add(5)
        heap.add(7)
        let expectedResult = 3

        // When
        heap.add(expectedResult)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Add_ManyElements_MinHeap() {
        let heap = Heap<Int>(type: .min)
        XCTAssertNil(heap.peek())
        heap.add(12)
        XCTAssertEqual(heap.peek(), 12)
        heap.add(4)
        XCTAssertEqual(heap.peek(), 4)
        heap.add(9)
        XCTAssertEqual(heap.peek(), 4)
        heap.add(17)
        XCTAssertEqual(heap.peek(), 4)
        heap.add(5)
        XCTAssertEqual(heap.peek(), 4)
        heap.add(8)
        XCTAssertEqual(heap.peek(), 4)
        heap.add(16)
        XCTAssertEqual(heap.peek(), 4)
        heap.add(13)
        XCTAssertEqual(heap.peek(), 4)
        heap.add(1)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(14)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(3)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(19)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(6)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(20)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(2)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(18)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(10)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(15)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(7)
        XCTAssertEqual(heap.peek(), 1)
        heap.add(11)
        XCTAssertEqual(heap.peek(), 1)
    }

    func test_Add_ChangeMax() {
        // Given
        let heap = Heap<Int>(type: .max)
        heap.add(5)
        let expectedResult = 10

        // When
        heap.add(expectedResult)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Add_ChangeMaxOneTime() {
        // Given
        let heap = Heap<Int>(type: .max)
        heap.add(5)
        heap.add(10)
        let expectedResult = 10

        // When
        heap.add(7)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Add_SwimUpTwoTimes_MaxHeap() {
        // Given
        let heap = Heap<Int>(type: .max)
        heap.add(5)
        heap.add(10)
        heap.add(7)
        let expectedResult = 15

        // When
        heap.add(expectedResult)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Add_ManyElements_MaxHeap() {
        let heap = Heap<Int>(type: .max)
        XCTAssertNil(heap.peek())
        heap.add(12)
        XCTAssertEqual(heap.peek(), 12)
        heap.add(4)
        XCTAssertEqual(heap.peek(), 12)
        heap.add(9)
        XCTAssertEqual(heap.peek(), 12)
        heap.add(17)
        XCTAssertEqual(heap.peek(), 17)
        heap.add(5)
        XCTAssertEqual(heap.peek(), 17)
        heap.add(8)
        XCTAssertEqual(heap.peek(), 17)
        heap.add(16)
        XCTAssertEqual(heap.peek(), 17)
        heap.add(13)
        XCTAssertEqual(heap.peek(), 17)
        heap.add(1)
        XCTAssertEqual(heap.peek(), 17)
        heap.add(14)
        XCTAssertEqual(heap.peek(), 17)
        heap.add(3)
        XCTAssertEqual(heap.peek(), 17)
        heap.add(19)
        XCTAssertEqual(heap.peek(), 19)
        heap.add(6)
        XCTAssertEqual(heap.peek(), 19)
        heap.add(20)
        XCTAssertEqual(heap.peek(), 20)
        heap.add(2)
        XCTAssertEqual(heap.peek(), 20)
        heap.add(18)
        XCTAssertEqual(heap.peek(), 20)
        heap.add(10)
        XCTAssertEqual(heap.peek(), 20)
        heap.add(15)
        XCTAssertEqual(heap.peek(), 20)
        heap.add(7)
        XCTAssertEqual(heap.peek(), 20)
        heap.add(11)
        XCTAssertEqual(heap.peek(), 20)
    }
}
