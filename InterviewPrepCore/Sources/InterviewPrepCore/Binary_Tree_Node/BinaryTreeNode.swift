//
// Created by Zach Miller on 24/01/2020.
//

class BinaryTreeNode<T> {
    // Properties
    let data: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?

    // Initializer
    init(data: T) {
        self.data = data
    }
}