//
// Created by Zach Miller on 24/01/2020.
//

class BinaryTreeNode<Element> {
    // Properties
    let data: Element
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    weak var parent: BinaryTreeNode?

    // Initializer
    init(data: Element) {
        self.data = data
    }

    // Methods

    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
    func listOfDepths() -> [LinkedList<Element>] {
        var resultLists: [LinkedList<Element>] = []
        self.listOfDepths(depth: 0, resultLists: &resultLists)
        return resultLists
    }

    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// Implement a function to check if a binary tree is balanced.
    /// For the purposes of this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any node never differ by more than one.
    func isBalanced() -> Bool {
        (self.heightIfBalanced() != nil)
    }
}

extension BinaryTreeNode where Element: Equatable {
    func contains(_ data: Element) -> Bool {
        if (self.data == data) {
            return true
        } else if let leftChildContainsData = self.leftChild?.contains(data), leftChildContainsData {
            return true
        } else if let rightChildContainsData = self.rightChild?.contains(data), rightChildContainsData {
            return true
        } else {
            return false
        }
    }

    func firstCommonAncestor(of child1: Element, and child2: Element) -> Element? {
        let commonAncestorInfo = self.commonAncestorInfo(targetChild1: child1, targetChild2: child2)
        return commonAncestorInfo.firstCommonAncestor
    }
}

extension BinaryTreeNode where Element: Comparable {
    func isBinarySearchTree() -> Bool {
        (self.rangeIfBinarySearchTree() != nil)
    }
}

// Private Inner Data Structures
private extension BinaryTreeNode {
    struct CommonAncestorInfo {
        let foundTargetChild1: Bool
        let foundTargetChild2: Bool
        let firstCommonAncestor: Element?
    }
}

// Private Methods
private extension BinaryTreeNode {
    func listOfDepths(depth: Int, resultLists: inout [LinkedList<Element>]) {
        if (depth < resultLists.count) {
            resultLists[depth].append(self.data)
        } else {
            let depthList = LinkedList<Element>()
            depthList.append(self.data)
            resultLists.append(depthList)
        }
        self.leftChild?.listOfDepths(depth: (depth + 1), resultLists: &resultLists)
        self.rightChild?.listOfDepths(depth: (depth + 1), resultLists: &resultLists)
    }

    func heightIfBalanced() -> Int? {
        let leftHeightIfBalanced = (self.leftChild != nil) ? self.leftChild!.heightIfBalanced() : -1
        guard let leftHeight = leftHeightIfBalanced else {
            return nil // Left subtree is unbalanced
        }

        let rightHeightIfBalanced = (self.rightChild != nil) ? self.rightChild!.heightIfBalanced() : -1
        guard let rightHeight = rightHeightIfBalanced else {
            return nil // Right subtree is unbalanced
        }

        if (abs(leftHeight - rightHeight) > 1) {
            return nil // Current node is unbalanced
        } else {
            return (max(leftHeight, rightHeight) + 1) // Current node is balanced; propagate current height
        }
    }
}

private extension BinaryTreeNode where Element: Equatable {
    func commonAncestorInfo(targetChild1: Element, targetChild2: Element) -> CommonAncestorInfo {
        var foundTarget1 = (self.data == targetChild1)
        var foundTarget2 = (self.data == targetChild2)
        if let leftSubtreeInfo = self.leftChild?.commonAncestorInfo(targetChild1: targetChild1, targetChild2: targetChild2) {
            if (leftSubtreeInfo.firstCommonAncestor != nil) {
                return leftSubtreeInfo // The left subtree has already found the first common ancestor
            }
            if leftSubtreeInfo.foundTargetChild1 {
                foundTarget1 = true
            }
            if leftSubtreeInfo.foundTargetChild2 {
                foundTarget2 = true
            }
            if let commonAncestorInfoAfterCheckingSubtree = self.commonAncestorInfoAfterCheckingSubtree(targetChild1: targetChild1, targetChild2: targetChild2, foundTarget1: foundTarget1, foundTarget2: foundTarget2) {
                return commonAncestorInfoAfterCheckingSubtree
            }
        }

        // At this point, we have not found a common ancestor, so we need to check the right subtree
        if let rightSubtreeInfo = self.rightChild?.commonAncestorInfo(targetChild1: targetChild1, targetChild2: targetChild2) {
            if (rightSubtreeInfo.firstCommonAncestor != nil) {
                return rightSubtreeInfo // The right subtree has already found the first common ancestor
            }
            if rightSubtreeInfo.foundTargetChild1 {
                foundTarget1 = true
            }
            if rightSubtreeInfo.foundTargetChild2 {
                foundTarget2 = true
            }
            if let commonAncestorInfoAfterCheckingSubtree = self.commonAncestorInfoAfterCheckingSubtree(targetChild1: targetChild1, targetChild2: targetChild2, foundTarget1: foundTarget1, foundTarget2: foundTarget2) {
                return commonAncestorInfoAfterCheckingSubtree
            }
        }

        // At this point, a common ancestor has not yet been found
        return CommonAncestorInfo(foundTargetChild1: foundTarget1, foundTargetChild2: foundTarget2, firstCommonAncestor: nil)
    }

    func commonAncestorInfoAfterCheckingSubtree(targetChild1: Element, targetChild2: Element, foundTarget1: Bool, foundTarget2: Bool) -> CommonAncestorInfo? {
        guard (foundTarget1 && foundTarget2) else {
            return nil // The common ancestor has not yet been found
        }
        let parentIsFirstCommonAncestor = ((self.data == targetChild1) || (self.data == targetChild2))
        if parentIsFirstCommonAncestor {
            return CommonAncestorInfo(foundTargetChild1: true, foundTargetChild2: true, firstCommonAncestor: nil)
        } else {
            return CommonAncestorInfo(foundTargetChild1: true, foundTargetChild2: true, firstCommonAncestor: self.data) // Self is first common ancestor
        }
    }
}

private extension BinaryTreeNode where Element: Comparable {
    func rangeIfBinarySearchTree() -> ClosedRange<Element>? {
        let leftSubtreeExists = (self.leftChild != nil)
        let rightSubtreeExists = (self.rightChild != nil)

        let leftSubtreeRange = self.leftChild?.rangeIfBinarySearchTree()
        if (leftSubtreeExists && (leftSubtreeRange == nil)) {
            return nil // Left subtree is not a binary search tree
        }

        let rightSubtreeRange = self.rightChild?.rangeIfBinarySearchTree()
        if (rightSubtreeExists && (rightSubtreeRange == nil)) {
            return nil // Right subtree is not a binary search tree
        }

        // When leftSubtreeExists, we can force unwrap leftSubtreeRange
        // When rightSubtreeExists, we can force unwrap rightSubtreeRange
        let currentTreeIsBST_ToTheLeft = leftSubtreeExists ? (leftSubtreeRange!.upperBound <= self.data) : true
        let currentTreeIsBST_ToTheRight = rightSubtreeExists ? (self.data < rightSubtreeRange!.lowerBound) : true

        let currentTreeIsBST = (currentTreeIsBST_ToTheLeft && currentTreeIsBST_ToTheRight)
        guard currentTreeIsBST else {
            return nil // Current tree is not a binary search tree
        }

        let currentTreeMin = leftSubtreeExists ? leftSubtreeRange!.lowerBound : self.data
        let currentTreeMax = rightSubtreeExists ? rightSubtreeRange!.upperBound : self.data
        return (currentTreeMin...currentTreeMax)
    }
}