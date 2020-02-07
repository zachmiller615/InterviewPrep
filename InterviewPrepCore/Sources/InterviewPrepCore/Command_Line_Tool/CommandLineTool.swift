//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let sortedElements = [1, 2, 3, 4, 5, 7, 8, 9, 10]
        let targetElement = 25
        let binarySearchTree = BinarySearchTree<Int>()
        for element in sortedElements {
            binarySearchTree.insert(element)
        }
        let result = binarySearchTree.contains(targetElement) // O(sortedElements.count)
        print(result)
        print("-----")
    }
}