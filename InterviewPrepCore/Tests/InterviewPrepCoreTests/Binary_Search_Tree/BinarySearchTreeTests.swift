//
// Created by Zach Miller on 18/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class BinarySearchTreeTests: XCTestCase {
    // Properties
    private let emptyBinarySearchTree = BinarySearchTree<Int>()
    private var fullBinarySearchTree: BinarySearchTree<Int>!

    // Methods
    override func setUp() {
        super.setUp()
        self.fillBinarySearchTree()
    }

    override func tearDown() {
        self.fullBinarySearchTree = nil
        super.tearDown()
    }

    // Private Methods
    private func fillBinarySearchTree() {
        self.fullBinarySearchTree = BinarySearchTree()
        fullBinarySearchTree.insert(3)
        fullBinarySearchTree.insert(2)
        fullBinarySearchTree.insert(1)
        fullBinarySearchTree.insert(6)
        fullBinarySearchTree.insert(4)
        fullBinarySearchTree.insert(5)
        fullBinarySearchTree.insert(7)
        fullBinarySearchTree.insert(8)
    }
}

// Test Cases for Contains
extension BinarySearchTreeTests {
    func test_Contains_EmptyTree() {
        // When
        let computedResult = self.emptyBinarySearchTree.contains(1)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_Contains_BasicCase_True() {
        // When
        let computedResult = self.fullBinarySearchTree.contains(5)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_Contains_BasicCase_False() {
        // When
        let computedResult = self.fullBinarySearchTree.contains(9)

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Depth
extension BinarySearchTreeTests {
    func test_Depth_0() {
        // Given
        let expectedResult = 0

        // When
        let computedResult = self.fullBinarySearchTree.depth(of: 3)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Depth_1() {
        // Given
        let expectedResult = 1

        // When
        let computedResult = self.fullBinarySearchTree.depth(of: 2)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Depth_2() {
        // Given
        let expectedResult = 2

        // When
        let computedResult = self.fullBinarySearchTree.depth(of: 1)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Depth_3() {
        // Given
        let expectedResult = 3

        // When
        let computedResult = self.fullBinarySearchTree.depth(of: 5)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Depth_EmptyTree_Nil() {
        // When
        let computedResult = self.emptyBinarySearchTree.depth(of: 9)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_Depth_FullTree_Nil() {
        // When
        let computedResult = self.fullBinarySearchTree.depth(of: 9)

        // Then
        XCTAssertNil(computedResult)
    }
}

// Test Cases for Create With Minimal Height
extension BinarySearchTreeTests {
    func test_CreateWithMinimalHeight_OddNumberOfElements() {
        // Given
        let sortedElements = [1, 2, 3, 4, 5, 6, 7]
        let expectedHeight = 2

        // When
        let binarySearchTree = BinarySearchTree.createWithMinimalHeight(sortedElements: sortedElements)
        let computedHeight = sortedElements.compactMap {
            binarySearchTree.depth(of: $0)
        }.max()

        // Then
        XCTAssertEqual(computedHeight, expectedHeight)
    }

    func test_CreateWithMinimalHeight_EvenNumberOfElements() {
        // Given
        let sortedElements = [1, 2, 3, 4, 5, 6, 7, 8]
        let expectedHeight = 3

        // When
        let binarySearchTree = BinarySearchTree.createWithMinimalHeight(sortedElements: sortedElements)
        let computedHeight = sortedElements.compactMap {
            binarySearchTree.depth(of: $0)
        }.max()

        // Then
        XCTAssertEqual(computedHeight, expectedHeight)
    }
}