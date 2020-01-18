//
// Created by Zach Miller on 18/01/2020.
//

private class Node<T> where T: Comparable {
    // Properties
    let data: T
    var leftChild: Node?
    var rightChild: Node?
    
    // Initializer
    init(data: T) {
        self.data = data
    }
}

class BinarySearchTree<T> where T: Comparable {
    // Properties
    private var root: Node<T>?

    // Methods
    func insert(_ data: T) {
        if let root = self.root {
            self.insert(data, into: root)
        } else {
            self.root = Node(data: data)
        }
    }

    func contains(_ data: T) -> Bool {
        guard let root = self.root else { return false }
        return self.contains(data, in: root)
    }

    func printTraversal(with traversalType: BinaryTreeTraversalType) {
        guard let root = self.root else { return }
        print("----------")
        switch traversalType {
        case .inOrder:
            self.printInOrderTraversal(of: root)
        case .preOrder:
            self.printPreOrderTraversal(of: root)
        case .postOrder:
            self.printPostOrderTraversal(of: root)
        }
        print("----------")
    }
}

// Private Methods
private extension BinarySearchTree {
    func shouldSearchLeft(data: T, in node: Node<T>) -> Bool {
        (data < node.data)
    }

    func insert(_ data: T, into node: Node<T>) {
        if self.shouldSearchLeft(data: data, in: node) {
            if let leftChild = node.leftChild {
                self.insert(data, into: leftChild)
            } else {
                node.leftChild = Node(data: data)
            }
        } else {
            if let rightChild = node.rightChild {
                self.insert(data, into: rightChild)
            } else {
                node.rightChild = Node(data: data)
            }
        }
    }

    func contains(_ data: T, in node: Node<T>) -> Bool {
        if (data == node.data) {
            return true
        } else if self.shouldSearchLeft(data: data, in: node) {
            if let leftChild = node.leftChild {
                return self.contains(data, in: leftChild)
            } else {
                return false
            }
        } else {
            if let rightChild = node.rightChild {
                return self.contains(data, in: rightChild)
            } else {
                return false
            }
        }
    }

    func printInOrderTraversal(of node: Node<T>) {
        if let leftChild = node.leftChild {
            self.printInOrderTraversal(of: leftChild)
        }
        print(node.data)
        if let rightChild = node.rightChild {
            self.printInOrderTraversal(of: rightChild)
        }
    }

    func printPreOrderTraversal(of node: Node<T>) {
        print(node.data)
        if let leftChild = node.leftChild {
            self.printPreOrderTraversal(of: leftChild)
        }
        if let rightChild = node.rightChild {
            self.printPreOrderTraversal(of: rightChild)
        }
    }

    func printPostOrderTraversal(of node: Node<T>) {
        if let leftChild = node.leftChild {
            self.printPostOrderTraversal(of: leftChild)
        }
        if let rightChild = node.rightChild {
            self.printPostOrderTraversal(of: rightChild)
        }
        print(node.data)
    }
}
