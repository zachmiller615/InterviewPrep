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
        heap.push(expectedResult)

        // When
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Case for Push
extension HeapTests {
    func test_Push_ChangeMin() {
        // Given
        let heap = Heap<Int>(type: .min)
        heap.push(10)
        let expectedResult = 5

        // When
        heap.push(expectedResult)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Push_ChangeMinOneTime() {
        // Given
        let heap = Heap<Int>(type: .min)
        heap.push(10)
        heap.push(5)
        let expectedResult = 5

        // When
        heap.push(7)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Push_SwimUpTwoTimes_MinHeap() {
        // Given
        let heap = Heap<Int>(type: .min)
        heap.push(10)
        heap.push(5)
        heap.push(7)
        let expectedResult = 3

        // When
        heap.push(expectedResult)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Push_ManyElements_MinHeap() {
        let heap = Heap<Int>(type: .min)
        XCTAssertNil(heap.peek())
        heap.push(12)
        XCTAssertEqual(heap.peek(), 12)
        heap.push(4)
        XCTAssertEqual(heap.peek(), 4)
        heap.push(9)
        XCTAssertEqual(heap.peek(), 4)
        heap.push(17)
        XCTAssertEqual(heap.peek(), 4)
        heap.push(5)
        XCTAssertEqual(heap.peek(), 4)
        heap.push(8)
        XCTAssertEqual(heap.peek(), 4)
        heap.push(16)
        XCTAssertEqual(heap.peek(), 4)
        heap.push(13)
        XCTAssertEqual(heap.peek(), 4)
        heap.push(1)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(14)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(3)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(19)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(6)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(20)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(2)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(18)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(10)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(15)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(7)
        XCTAssertEqual(heap.peek(), 1)
        heap.push(11)
        XCTAssertEqual(heap.peek(), 1)
    }

    func test_Push_ChangeMax() {
        // Given
        let heap = Heap<Int>(type: .max)
        heap.push(5)
        let expectedResult = 10

        // When
        heap.push(expectedResult)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Push_ChangeMaxOneTime() {
        // Given
        let heap = Heap<Int>(type: .max)
        heap.push(5)
        heap.push(10)
        let expectedResult = 10

        // When
        heap.push(7)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Push_SwimUpTwoTimes_MaxHeap() {
        // Given
        let heap = Heap<Int>(type: .max)
        heap.push(5)
        heap.push(10)
        heap.push(7)
        let expectedResult = 15

        // When
        heap.push(expectedResult)
        let computedResult = heap.peek()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Push_ManyElements_MaxHeap() {
        let heap = Heap<Int>(type: .max)
        XCTAssertNil(heap.peek())
        heap.push(12)
        XCTAssertEqual(heap.peek(), 12)
        heap.push(4)
        XCTAssertEqual(heap.peek(), 12)
        heap.push(9)
        XCTAssertEqual(heap.peek(), 12)
        heap.push(17)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(5)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(8)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(16)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(13)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(1)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(14)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(3)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(19)
        XCTAssertEqual(heap.peek(), 19)
        heap.push(6)
        XCTAssertEqual(heap.peek(), 19)
        heap.push(20)
        XCTAssertEqual(heap.peek(), 20)
        heap.push(2)
        XCTAssertEqual(heap.peek(), 20)
        heap.push(18)
        XCTAssertEqual(heap.peek(), 20)
        heap.push(10)
        XCTAssertEqual(heap.peek(), 20)
        heap.push(15)
        XCTAssertEqual(heap.peek(), 20)
        heap.push(7)
        XCTAssertEqual(heap.peek(), 20)
        heap.push(11)
        XCTAssertEqual(heap.peek(), 20)
    }
}

// Test Cases for Poll
extension HeapTests {
    func test_Poll_ManyElements_MinHeap() {
        let heap = Heap<Int>(type: .min)
        XCTAssertNil(heap.poll())
        heap.push(15)
        heap.push(7)
        heap.push(10)
        heap.push(4)
        heap.push(11)
        XCTAssertEqual(heap.poll(), 4)
        XCTAssertEqual(heap.peek(), 7)
        heap.push(16)
        heap.push(3)
        heap.push(5)
        heap.push(8)
        heap.push(18)
        XCTAssertEqual(heap.poll(), 3)
        XCTAssertEqual(heap.peek(), 5)
        heap.push(1)
        heap.push(17)
        heap.push(9)
        heap.push(14)
        heap.push(6)
        XCTAssertEqual(heap.poll(), 1)
        XCTAssertEqual(heap.peek(), 5)
        heap.push(13)
        heap.push(20)
        heap.push(2)
        heap.push(12)
        heap.push(19)
        XCTAssertEqual(heap.poll(), 2)
        XCTAssertEqual(heap.peek(), 5)
    }

    func test_Poll_ManyElements_MaxHeap() {
        let heap = Heap<Int>(type: .max)
        XCTAssertNil(heap.poll())
        heap.push(20)
        heap.push(13)
        heap.push(3)
        heap.push(17)
        heap.push(8)
        XCTAssertEqual(heap.poll(), 20)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(6)
        heap.push(10)
        heap.push(1)
        heap.push(14)
        heap.push(18)
        XCTAssertEqual(heap.poll(), 18)
        XCTAssertEqual(heap.peek(), 17)
        heap.push(9)
        heap.push(2)
        heap.push(1)
        heap.push(4)
        heap.push(15)
        XCTAssertEqual(heap.poll(), 17)
        XCTAssertEqual(heap.peek(), 15)
        heap.push(19)
        heap.push(16)
        heap.push(5)
        heap.push(12)
        heap.push(7)
        XCTAssertEqual(heap.poll(), 19)
        XCTAssertEqual(heap.peek(), 16)
    }
}
