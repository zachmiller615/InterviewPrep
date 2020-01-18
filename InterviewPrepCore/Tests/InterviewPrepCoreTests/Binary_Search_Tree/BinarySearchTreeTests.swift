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
