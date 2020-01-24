//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let bigOExamples = BigOExamples()
        let node1 = BinaryTreeNode(data: 1)
        let node2 = BinaryTreeNode(data: 2)
        let node3 = BinaryTreeNode(data: 3)
        let node4 = BinaryTreeNode(data: 4)
        let node5 = BinaryTreeNode(data: 5)
        let node6 = BinaryTreeNode(data: 6)
        let node7 = BinaryTreeNode(data: 7)
        node4.leftChild = node2
        node4.rightChild = node6
        node2.leftChild = node1
        node2.rightChild = node3
        node6.leftChild = node5
        node6.rightChild = node7
        let _ = bigOExamples.example9(input: node4)
    }
}