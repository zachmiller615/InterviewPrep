//
// Created by Zach Miller on 04/02/2020.
//

import XCTest
@testable import InterviewPrepCore

class BinaryTreeNodeTests: XCTestCase {
    // Properties
    private var binaryTreeRoot: BinaryTreeNode<Int>!

    // Methods
    override func setUp() {
        super.setUp()
        self.fillBinaryTree()
    }

    override func tearDown() {
        self.binaryTreeRoot = nil
        super.tearDown()
    }

    // Private Methods
    private func fillBinaryTree() {
        self.binaryTreeRoot = BinaryTreeNode(data: 1)
        let node2 = BinaryTreeNode(data: 2)
        let node3 = BinaryTreeNode(data: 3)
        let node4 = BinaryTreeNode(data: 4)
        let node5 = BinaryTreeNode(data: 5)
        let node6 = BinaryTreeNode(data: 6)
        let node7 = BinaryTreeNode(data: 7)
        let node8 = BinaryTreeNode(data: 8)
        let node9 = BinaryTreeNode(data: 9)
        self.binaryTreeRoot.leftChild = node2
        self.binaryTreeRoot.rightChild = node3
        node2.leftChild = node4
        node3.rightChild = node5
        node4.leftChild = node6
        node4.rightChild = node7
        node5.leftChild = node8
        node7.leftChild = node9
    }
}

// Test Cases for Contains
extension BinaryTreeNodeTests {
    func test_Contains_True() {
        // When
        let computedResult = self.binaryTreeRoot.contains(9)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_Contains_False() {
        // When
        let computedResult = self.binaryTreeRoot.contains(10)

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for List of Depths
extension BinaryTreeNodeTests {
    func test_ListOfDepths() {
        // Given
        let depth0 = LinkedList<Int>()
        let depth1 = LinkedList<Int>()
        let depth2 = LinkedList<Int>()
        let depth3 = LinkedList<Int>()
        let depth4 = LinkedList<Int>()
        depth0.append(1)
        depth1.append(2)
        depth1.append(3)
        depth2.append(4)
        depth2.append(5)
        depth3.append(6)
        depth3.append(7)
        depth3.append(8)
        depth4.append(9)
        let expectedResult = [depth0, depth1, depth2, depth3, depth4]

        // When
        let computedResult = self.binaryTreeRoot.listOfDepths()

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}