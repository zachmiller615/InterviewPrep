//
// Created by Zach Miller on 17/01/2020.
//

private class LinkedListNode<T> where T: Equatable {
    // Properties
    let data: T
    var next: LinkedListNode?

    // Initializer
    init(data: T) {
        self.data = data
    }
}

class LinkedList<T> where T: Equatable {
    // Properties
    private var head: LinkedListNode<T>?

    // Methods
    func toArray() -> [T] {
        var resultArray: [T] = []
        var optionalCurrentNode: LinkedListNode<T>? = head
        while let currentNode = optionalCurrentNode {
            resultArray.append(currentNode.data)
            optionalCurrentNode = currentNode.next
        }
        return resultArray
    }

    func prepend(_ data: T) {
        let newNode = LinkedListNode(data: data)
        newNode.next = self.head
        self.head = newNode
    }

    func append(_ data: T) {
        guard let head = self.head else {
            self.prepend(data)
            return
        }
        let newNode = LinkedListNode(data: data)
        var currentNode = head
        while let nextNode = currentNode.next {
            currentNode = nextNode
        }
        currentNode.next = newNode
    }

    func removeAllOccurrences(of data: T) {
        self.removeOccurrencesFromStart(of: data)
        guard let head = self.head else { return }
        var previousNode = head
        while let currentNode = previousNode.next {
            if (currentNode.data == data) {
                previousNode.next = currentNode.next
            } else {
                previousNode = currentNode
            }
        }
    }

    func removeOccurrencesFromStart(of data: T) {
        var optionalCurrentNode = self.head
        while let currentNode = optionalCurrentNode {
            if ((currentNode === self.head) && (currentNode.data == data)) {
                optionalCurrentNode = currentNode.next
                self.head = currentNode.next
            } else {
                return
            }
        }
    }
}
