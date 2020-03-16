//
// Created by Zach Miller on 17/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class LinkedListTests: XCTestCase {}

// Test Cases for Prepend
extension LinkedListTests {
    func test_Prepend_OneElement() {
        // Given
        let linkedList = LinkedList<String>()
        let expectedResult = ["A"]

        // When
        linkedList.prepend("A")
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Prepend_TenElements() {
        // Given
        let linkedList = LinkedList<String>()
        for _ in 0..<9 {
            linkedList.prepend("B")
        }
        let expectedResult = ["A", "B", "B", "B", "B", "B", "B", "B", "B", "B"]

        // When
        linkedList.prepend("A")
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Append
extension LinkedListTests {
    func test_Append_OneElement() {
        // Given
        let linkedList = LinkedList<String>()
        let expectedResult = ["A"]

        // When
        linkedList.append("A")
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Append_TenElements() {
        // Given
        let linkedList = LinkedList<String>()
        for _ in 0..<9 {
            linkedList.append("A")
        }
        let expectedResult = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B"]

        // When
        linkedList.append("B")
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Remove All Occurrences
extension LinkedListTests {
    func test_RemoveAllOccurrences_EmptyList() {
        // Given
        let linkedList = LinkedList<String>()
        let expectedResult: [String] = []

        // When
        linkedList.removeAllOccurrences(of: "A")
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_RemoveAllOccurrences_ListWithContent() {
        // Given
        let linkedList = LinkedList<String>()
        for letter in ["A", "B", "C", "A", "B", "C", "A", "B", "C"] {
            linkedList.append(letter)
        }
        let expectedResult = ["B", "C", "B", "C", "B", "C"]

        // When
        linkedList.removeAllOccurrences(of: "A")
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_RemoveAllOccurrences_UniformList() {
        // Given
        let linkedList = LinkedList<String>()
        for _ in 0...9 {
            linkedList.append("A")
        }
        let expectedResult: [String] = []

        // When
        linkedList.removeAllOccurrences(of: "A")
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Remove Occurrences From Start
extension LinkedListTests {
    func test_RemoveOccurrencesFromStart() {
        // Given
        let linkedList = LinkedList<String>()
        for letter in ["A", "A", "A", "B", "C", "A"] {
            linkedList.append(letter)
        }
        let expectedResult = ["B", "C", "A"]

        // When
        linkedList.removeOccurrencesFromStart(of: "A")
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Remove Duplicates
extension LinkedListTests {
    func test_RemoveDuplicates_BasicCase() {
        // Given
        let linkedList = LinkedList<String>()
        for letter in ["A", "B", "C", "A", "B", "C", "D", "A"] {
            linkedList.append(letter)
        }
        let expectedResult = ["A", "B", "C", "D"]

        // When
        linkedList.removeDuplicates()
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_RemoveDuplicates_EmptyList() {
        // Given
        let linkedList = LinkedList<String>()
        let expectedResult: [String] = []

        // When
        linkedList.removeDuplicates()
        let computedResult = linkedList.toArray()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Element From Last
extension LinkedListTests {
    func test_ElementFromLast_BasicCase() {
        // Given
        let linkedList = LinkedList<String>()
        for letter in ["A", "B", "C", "D", "E", "F", "G"] {
            linkedList.append(letter)
        }
        let offsetFromLastElement = 2
        let expectedResult = "E"

        // When
        let computedResult = linkedList.elementFromLast(offsetFromLastElement: offsetFromLastElement)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_ElementFromLast_EmptyList() {
        // Given
        let linkedList = LinkedList<String>()
        let offsetFromLastElement = 0

        // When
        let computedResult = linkedList.elementFromLast(offsetFromLastElement: offsetFromLastElement)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_ElementFromLast_InvalidOffset() {
        // Given
        let linkedList = LinkedList<String>()
        for letter in ["A", "B", "C", "D", "E", "F", "G"] {
            linkedList.append(letter)
        }
        let offsetFromLastElement = 10

        // When
        let computedResult = linkedList.elementFromLast(offsetFromLastElement: offsetFromLastElement)

        // Then
        XCTAssertNil(computedResult)
    }
}