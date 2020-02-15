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

// Test Cases for First Common Ancestor
extension BinaryTreeNodeTests {
    func test_FirstCommonAncestor_BasicCase() {
        // Given
        let node50 = BinaryTreeNode(data: 50)
        let node60 = BinaryTreeNode(data: 60)
        let node55 = BinaryTreeNode(data: 55)
        let node15 = BinaryTreeNode(data: 15)
        let node7 = BinaryTreeNode(data: 7)
        let node100 = BinaryTreeNode(data: 100)
        let node25 = BinaryTreeNode(data: 25)
        let node10 = BinaryTreeNode(data: 10)
        let node40 = BinaryTreeNode(data: 40)
        let node53 = BinaryTreeNode(data: 53)
        let node26 = BinaryTreeNode(data: 26)
        node50.leftChild = node60
        node50.rightChild = node55
        node60.leftChild = node15
        node60.rightChild = node7
        node55.leftChild = node100
        node55.rightChild = node25
        node15.leftChild = node10
        node7.rightChild = node40
        node25.leftChild = node53
        node40.leftChild = node26

        let expectedResult = 60

        // When
        let computedResult = node50.firstCommonAncestor(of: node10.data, and: node26.data)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_FirstCommonAncestor_LargeTree() {
        // Given
        let node1 = BinaryTreeNode(data: 1)
        let node2 = BinaryTreeNode(data: 2)
        let node3 = BinaryTreeNode(data: 3)
        let node4 = BinaryTreeNode(data: 4)
        let node5 = BinaryTreeNode(data: 5)
        let node6 = BinaryTreeNode(data: 6)
        let node7 = BinaryTreeNode(data: 7)
        let node8 = BinaryTreeNode(data: 8)
        let node9 = BinaryTreeNode(data: 9)
        let node10 = BinaryTreeNode(data: 10)
        let node11 = BinaryTreeNode(data: 11)
        let node12 = BinaryTreeNode(data: 12)
        let node13 = BinaryTreeNode(data: 13)
        let node14 = BinaryTreeNode(data: 14)
        let node15 = BinaryTreeNode(data: 15)
        let node16 = BinaryTreeNode(data: 16)
        let node17 = BinaryTreeNode(data: 17)
        let node18 = BinaryTreeNode(data: 18)
        let node19 = BinaryTreeNode(data: 19)
        let node20 = BinaryTreeNode(data: 20)
        let node21 = BinaryTreeNode(data: 21)
        let node22 = BinaryTreeNode(data: 22)
        let node23 = BinaryTreeNode(data: 23)
        let node24 = BinaryTreeNode(data: 24)
        let node25 = BinaryTreeNode(data: 25)
        node1.leftChild = node2
        node1.rightChild = node3
        node2.leftChild = node4
        node3.rightChild = node5
        node4.leftChild = node6
        node4.rightChild = node7
        node5.leftChild = node8
        node5.rightChild = node9
        node6.rightChild = node10
        node8.leftChild = node11
        node10.leftChild = node12
        node10.rightChild = node13
        node11.leftChild = node14
        node11.rightChild = node15
        node13.rightChild = node18
        node14.rightChild = node16
        node18.leftChild = node19
        node16.leftChild = node17
        node19.leftChild = node20
        node19.rightChild = node21
        node17.rightChild = node22
        node22.leftChild = node23
        node22.rightChild = node24
        node24.rightChild = node25

        let expectedResult = 5

        // When
        let computedResult = node1.firstCommonAncestor(of: node9.data, and: node22.data)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
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

// Test Cases for Is Balanced
extension BinaryTreeNodeTests {
    func test_IsBalanced_True() {
        // Given
        let node1 = BinaryTreeNode(data: 1)
        let node2 = BinaryTreeNode(data: 2)
        let node3 = BinaryTreeNode(data: 3)
        let node4 = BinaryTreeNode(data: 4)
        let node5 = BinaryTreeNode(data: 5)
        let node6 = BinaryTreeNode(data: 6)
        let node7 = BinaryTreeNode(data: 7)
        let node8 = BinaryTreeNode(data: 8)
        let node9 = BinaryTreeNode(data: 9)
        node1.leftChild = node2
        node1.rightChild = node3
        node2.leftChild = node4
        node2.rightChild = node5
        node3.leftChild = node6
        node3.rightChild = node7
        node5.leftChild = node8
        node6.rightChild = node9

        // When
        let computedResult = node1.isBalanced()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_IsBalanced_False() {
        // Given
        let node1 = BinaryTreeNode(data: 1)
        let node2 = BinaryTreeNode(data: 2)
        let node3 = BinaryTreeNode(data: 3)
        let node4 = BinaryTreeNode(data: 4)
        let node5 = BinaryTreeNode(data: 5)
        let node6 = BinaryTreeNode(data: 6)
        let node7 = BinaryTreeNode(data: 7)
        let node8 = BinaryTreeNode(data: 8)
        let node9 = BinaryTreeNode(data: 9)
        let node10 = BinaryTreeNode(data: 9)
        node1.leftChild = node2
        node1.rightChild = node3
        node2.leftChild = node4
        node2.rightChild = node5
        node3.leftChild = node6
        node3.rightChild = node7
        node5.leftChild = node8
        node6.rightChild = node9
        node8.rightChild = node10

        // When
        let computedResult = node1.isBalanced()

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Is Binary Search Tree
extension BinaryTreeNodeTests {
    func test_IsBinarySearchTree_BasicCase_True() {
        // Given
        let node1 = BinaryTreeNode(data: 1)
        let node2 = BinaryTreeNode(data: 2)
        let node3 = BinaryTreeNode(data: 3)
        let node4 = BinaryTreeNode(data: 4)
        let node5 = BinaryTreeNode(data: 5)
        let node6 = BinaryTreeNode(data: 6)
        let node7 = BinaryTreeNode(data: 7)
        let node8 = BinaryTreeNode(data: 8)
        let node9 = BinaryTreeNode(data: 9)
        node4.leftChild = node2
        node4.rightChild = node6
        node2.leftChild = node1
        node2.rightChild = node3
        node6.leftChild = node5
        node6.rightChild = node7
        node7.rightChild = node8
        node8.rightChild = node9

        // When
        let computedResult = node4.isBinarySearchTree()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_IsBinarySearchTree_BasicCase_False() {
        // When
        let computedResult = self.binaryTreeRoot.isBinarySearchTree()

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_IsBinarySearchTree_ComplexCase_False() {
        // Given
        let node1 = BinaryTreeNode(data: 1)
        let node2 = BinaryTreeNode(data: 2)
        let node3 = BinaryTreeNode(data: 3)
        let node4 = BinaryTreeNode(data: 4)
        node2.leftChild = node1
        node2.rightChild = node4
        node1.rightChild = node3

        // When
        let computedResult = node2.isBinarySearchTree()

        // Then
        XCTAssertFalse(computedResult)
    }
}