//
// Created by Zach Miller on 24/01/2020.
//

class BinaryTreeNode<Element> {
    // Properties
    let data: Element
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?

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
}