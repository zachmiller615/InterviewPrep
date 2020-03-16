//
// Created by Zach Miller on 18/01/2020.
//

class BinarySearchTree<Element> where Element: Comparable {
    // Properties
    private var root: BinaryTreeNode<Element>?

    // Methods
    func insert(_ data: Element) {
        if let root = self.root {
            self.insert(data, into: root)
        } else {
            self.root = BinaryTreeNode(data: data)
        }
    }

    func contains(_ data: Element) -> Bool {
        guard let root = self.root else { return false }
        return self.contains(data, in: root)
    }

    func depth(of data: Element) -> Int? {
        guard let root = self.root else {
            return nil
        }
        return self.depth(of: data, in: root)
    }

    func min() -> Element? {
        guard let root = self.root else {
            return nil
        }
        return self.min(in: root)
    }

    func inOrderSuccessor(of data: Element) -> Element? {
        self.inOrderSuccessor(of: data, in: self.root)
    }

    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// A binary search tree was created by traversing through an array from left to right and inserting each element.
    /// Given a binary search tree with distinct elements, print all possible arrays that could have led to this tree.
    func creationSequences() -> [[Element]] {
        guard let root = self.root else {
            return []
        }
        return self.creationSequences(of: root)
    }

    // Static Functions
    static func createWithMinimalHeight(sortedElements: [Element]) -> BinarySearchTree<Element> {
        let binarySearchTree = BinarySearchTree()
        var insertionOrderArray: [Element] = []

        BinarySearchTree.createInsertionOrderForMinimalHeight(
                sortedArray: sortedElements,
                sortedArrayFirstIndex: 0,
                sortedArrayLastIndex: (sortedElements.count - 1),
                insertionOrderArray: &insertionOrderArray)

        for element in insertionOrderArray {
            binarySearchTree.insert(element)
        }

        return binarySearchTree
    }
}

// Private Methods
private extension BinarySearchTree {
    func shouldSearchLeft(data: Element, in node: BinaryTreeNode<Element>) -> Bool {
        (data < node.data)
    }

    func insert(_ data: Element, into node: BinaryTreeNode<Element>) {
        if self.shouldSearchLeft(data: data, in: node) {
            if let leftChild = node.leftChild {
                self.insert(data, into: leftChild)
            } else {
                self.createNewNode(with: data, ontoParent: node, inDirection: .left)
            }
        } else {
            if let rightChild = node.rightChild {
                self.insert(data, into: rightChild)
            } else {
                self.createNewNode(with: data, ontoParent: node, inDirection: .right)
            }
        }
    }

    func createNewNode(with data: Element, ontoParent parent: BinaryTreeNode<Element>, inDirection direction: BinaryTreeNodeChildDirection) {
        let newNode = BinaryTreeNode(data: data)
        newNode.parent = parent
        switch direction {
        case .left:
            parent.leftChild = newNode
        case .right:
            parent.rightChild = newNode
        }
    }

    func contains(_ data: Element, in node: BinaryTreeNode<Element>) -> Bool {
        if (data == node.data) {
            return true
        }
        if self.shouldSearchLeft(data: data, in: node) {
            if let leftChild = node.leftChild {
                return self.contains(data, in: leftChild)
            }
            return false
        }
        if let rightChild = node.rightChild {
            return self.contains(data, in: rightChild)
        }
        return false
    }

    func depth(of data: Element, in node: BinaryTreeNode<Element>) -> Int? {
        if (data == node.data) {
            return 0
        } else if self.shouldSearchLeft(data: data, in: node) {
            if let leftChild = node.leftChild, let leftDepth = self.depth(of: data, in: leftChild) {
                return (1 + leftDepth)
            } else {
                return nil
            }
        } else {
            if let rightChild = node.rightChild, let rightDepth = self.depth(of: data, in: rightChild) {
                return (1 + rightDepth)
            } else {
                return nil
            }
        }
    }

    func min(in node: BinaryTreeNode<Element>) -> Element {
        if let leftChild = node.leftChild {
            return self.min(in: leftChild)
        } else {
            return node.data
        }
    }

    func inOrderSuccessor(of targetData: Element, in optionalCurrentNode: BinaryTreeNode<Element>?) -> Element? {
        guard let currentNode = optionalCurrentNode else {
            return nil // Target data does not exist in binary search tree
        }
        if (targetData < currentNode.data) {
            return self.inOrderSuccessor(of: targetData, in: currentNode.leftChild)
        } else if (targetData > currentNode.data) {
            return self.inOrderSuccessor(of: targetData, in: currentNode.rightChild)
        }

        // At this point, targetData == currentNode.data
        if let rightChild = currentNode.rightChild {
            return self.min(in: rightChild)
        }

        var optionalPossibleSuccessor = currentNode.parent
        while let possibleSuccessor = optionalPossibleSuccessor {
            if (possibleSuccessor.data > targetData) {
                return possibleSuccessor.data
            } else {
                optionalPossibleSuccessor = possibleSuccessor.parent
            }
        }

        // At this point, targetData is the greatest element in the binary search tree
        return nil
    }

    func creationSequences(of node: BinaryTreeNode<Element>) -> [[Element]] {
        let arrayMerger = ArrayMerger()
        var leftTreeSequences: [[Element]] = []
        var rightTreeSequences: [[Element]] = []
        var currentTreeSequences: [[Element]] = []

        // Get child tree sequences
        if let leftChild = node.leftChild {
            leftTreeSequences = self.creationSequences(of: leftChild)
        }
        if let rightChild = node.rightChild {
            rightTreeSequences = self.creationSequences(of: rightChild)
        }

        // Merge child tree sequences
        if leftTreeSequences.isEmpty {
            currentTreeSequences.append(contentsOf: rightTreeSequences)
        } else if rightTreeSequences.isEmpty {
            currentTreeSequences.append(contentsOf: leftTreeSequences)
        } else {
            for leftTreeSequence in leftTreeSequences {
                for rightTreeSequence in rightTreeSequences {
                    let mergedSequences = arrayMerger.combinationsKeepingRespectiveOrders(array1: leftTreeSequence, array2: rightTreeSequence)
                    currentTreeSequences.append(contentsOf: mergedSequences)
                }
            }
        }

        // Add current node.data to the sequences
        if currentTreeSequences.isEmpty {
            return [[node.data]]
        } else {
            return (currentTreeSequences.map {
                [node.data] + $0
            })
        }
    }
}

// Private Static Functions
private extension BinarySearchTree {
    static func createInsertionOrderForMinimalHeight(sortedArray: [Element], sortedArrayFirstIndex: Int, sortedArrayLastIndex: Int, insertionOrderArray: inout [Element]) {
        if (sortedArrayLastIndex < sortedArrayFirstIndex) {
            return
        }
        let sortedArrayMiddleIndex = ((sortedArrayFirstIndex + sortedArrayLastIndex + 1) / 2)
        let sortedArrayMiddleElement = sortedArray[sortedArrayMiddleIndex]
        insertionOrderArray.append(sortedArrayMiddleElement)

        // Go left
        BinarySearchTree.createInsertionOrderForMinimalHeight(
                sortedArray: sortedArray,
                sortedArrayFirstIndex: sortedArrayFirstIndex,
                sortedArrayLastIndex: (sortedArrayMiddleIndex - 1),
                insertionOrderArray: &insertionOrderArray)

        // Go right
        BinarySearchTree.createInsertionOrderForMinimalHeight(
                sortedArray: sortedArray,
                sortedArrayFirstIndex: (sortedArrayMiddleIndex + 1),
                sortedArrayLastIndex: sortedArrayLastIndex,
                insertionOrderArray: &insertionOrderArray)

    }
}
