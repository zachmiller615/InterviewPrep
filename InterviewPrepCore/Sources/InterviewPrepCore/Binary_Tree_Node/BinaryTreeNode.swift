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

    // Static Functions
    static func preOrderTraversalWithNilNodes(root: BinaryTreeNode<Element>) -> [Element?] {
        var traversal: [Element?] = []
        BinaryTreeNode.preOrderTraversalWithNilNodes(currentNode: root, traversal: &traversal)
        return traversal
    }
}

extension BinaryTreeNode where Element: Equatable {
    func contains(_ data: Element) -> Bool {
        if (self.data == data) {
            return true
        }
        if let leftChildContainsData = self.leftChild?.contains(data), leftChildContainsData {
            return true
        }
        if let rightChildContainsData = self.rightChild?.contains(data), rightChildContainsData {
            return true
        }
        return false
    }

    func firstCommonAncestor(of child1: Element, and child2: Element) -> Element? {
        let commonAncestorInfo = self.commonAncestorInfo(targetChild1: child1, targetChild2: child2)
        return commonAncestorInfo.firstCommonAncestor
    }

    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// T1 and T2 are two very large binary trees, with T1 much bigger than T2.
    /// Create an algorithm to determine if T2 is a subtree of T1.
    /// A tree T2 is a subtree of T1 if there exists a node n in T1 such that the subtree of n is identical to T2.
    /// That is, if you cut off the tree at node n, the two trees would be identical.
    func containsSubtree(_ possibleSubtree: BinaryTreeNode<Element>) -> Bool {
        if (self.data == possibleSubtree.data) {
            let possibleSubtreeTraversal = BinaryTreeNode.preOrderTraversalWithNilNodes(root: possibleSubtree)
            let currentNodeTraversal = BinaryTreeNode.preOrderTraversalWithNilNodes(root: self)
            if (possibleSubtreeTraversal == currentNodeTraversal) {
                return true
            }
        }
        let leftSideContainsSubtree = (self.leftChild?.containsSubtree(possibleSubtree) ?? false)
        if leftSideContainsSubtree {
            return true
        }
        let rightSideContainsSubtree = (self.rightChild?.containsSubtree(possibleSubtree) ?? false)
        return rightSideContainsSubtree
    }
}

extension BinaryTreeNode where Element: Comparable {
    func isBinarySearchTree() -> Bool {
        (self.rangeIfBinarySearchTree() != nil)
    }
}

extension BinaryTreeNode where Element: AdditiveArithmetic {
    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// You are given a binary tree in which each node contains an integer value (which might be positive or negative).
    /// Design an algorithm to count the number of paths that sum to a given value.
    /// The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
    func pathsWithSum(targetSum: Element) -> Int {
        self.pathsWithSumInfo(targetSum: targetSum).numberOfValidPaths
    }

    private struct PathsWithSumInfo {
        let numberOfValidPaths: Int
        let pathSums: [Element]
    }

    private func pathsWithSumInfo(targetSum: Element) -> PathsWithSumInfo {
        let defaultPathsInfo = PathsWithSumInfo(numberOfValidPaths: 0, pathSums: [])
        let leftSubtreeInfo = (self.leftChild?.pathsWithSumInfo(targetSum: targetSum) ?? defaultPathsInfo)
        let rightSubtreeInfo = (self.rightChild?.pathsWithSumInfo(targetSum: targetSum) ?? defaultPathsInfo)
        let numberOfValidPathsInChildren = (leftSubtreeInfo.numberOfValidPaths + rightSubtreeInfo.numberOfValidPaths)
        var pathSums = (leftSubtreeInfo.pathSums + rightSubtreeInfo.pathSums)
        pathSums = pathSums.map { (pathSum: Element) in
            pathSum + self.data
        }
        pathSums.append(self.data)
        let numberOfValidPathsWithSelf = pathSums.filter { (pathSum: Element) in
            (pathSum == targetSum)
        }.count
        let numberOfTotalValidPaths = (numberOfValidPathsInChildren + numberOfValidPathsWithSelf)
        return PathsWithSumInfo(numberOfValidPaths: numberOfTotalValidPaths, pathSums: pathSums)
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
        }
        return (max(leftHeight, rightHeight) + 1) // Current node is balanced; propagate current height
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
        }
        return CommonAncestorInfo(foundTargetChild1: true, foundTargetChild2: true, firstCommonAncestor: self.data) // Self is first common ancestor
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

// Private Static Functions
private extension BinaryTreeNode {
    static func preOrderTraversalWithNilNodes(currentNode: BinaryTreeNode, traversal: inout [Element?]) {
        traversal.append(currentNode.data)
        if let leftChild = currentNode.leftChild {
            BinaryTreeNode.preOrderTraversalWithNilNodes(currentNode: leftChild, traversal: &traversal)
        } else {
            traversal.append(nil)
        }
        if let rightChild = currentNode.rightChild {
            BinaryTreeNode.preOrderTraversalWithNilNodes(currentNode: rightChild, traversal: &traversal)
        } else {
            traversal.append(nil)
        }
    }
}