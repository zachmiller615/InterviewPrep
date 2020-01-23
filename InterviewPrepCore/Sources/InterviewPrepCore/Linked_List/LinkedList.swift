//
// Created by Zach Miller on 17/01/2020.
//

private class LinkedListNode<Element> where Element: Hashable {
    // Properties
    let data: Element
    var next: LinkedListNode?

    // Initializer
    init(data: Element) {
        self.data = data
    }
}

class LinkedList<Element> where Element: Hashable {
    // Properties
    private var head: LinkedListNode<Element>?

    // Methods
    func toArray() -> [Element] {
        var resultArray: [Element] = []
        var optionalCurrentNode: LinkedListNode<Element>? = head
        while let currentNode = optionalCurrentNode {
            resultArray.append(currentNode.data)
            optionalCurrentNode = currentNode.next
        }
        return resultArray
    }

    func prepend(_ data: Element) {
        let newNode = LinkedListNode(data: data)
        newNode.next = self.head
        self.head = newNode
    }

    func append(_ data: Element) {
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

    func removeAllOccurrences(of data: Element) {
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

    func removeOccurrencesFromStart(of data: Element) {
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

    func removeDuplicates() {
        guard let head = self.head else {
            return
        }
        var seenElements = Set<Element>()
        seenElements.insert(head.data)
        var optionalCurrentNode: LinkedListNode? = head
        while let currentNode = optionalCurrentNode, let nextNode = currentNode.next {
            if seenElements.contains(nextNode.data) {
                currentNode.next = nextNode.next
            } else {
                seenElements.insert(nextNode.data)
                optionalCurrentNode = currentNode.next
            }
        }
    }
}