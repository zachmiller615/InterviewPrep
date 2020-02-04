//
// Created by Zach Miller on 17/01/2020.
//

class LinkedList<Element> {
    // Properties
    private var head: ListNode<Element>?

    // Methods
    func toArray() -> [Element] {
        var resultArray: [Element] = []
        var optionalCurrentNode: ListNode<Element>? = head
        while let currentNode = optionalCurrentNode {
            resultArray.append(currentNode.data)
            optionalCurrentNode = currentNode.next
        }
        return resultArray
    }

    func prepend(_ data: Element) {
        let newNode = ListNode(data: data)
        newNode.next = self.head
        self.head = newNode
    }

    func append(_ data: Element) {
        guard let head = self.head else {
            self.prepend(data)
            return
        }
        let newNode = ListNode(data: data)
        var currentNode = head
        while let nextNode = currentNode.next {
            currentNode = nextNode
        }
        currentNode.next = newNode
    }

    func elementFromLast(offsetFromLastElement: Int) -> Element? {
        guard let head = self.head else {
            return nil
        }
        var fastRunner = head
        var slowRunner = head
        for _ in (0..<offsetFromLastElement) {
            if let fastRunnerNext = fastRunner.next {
                fastRunner = fastRunnerNext
            } else {
                return nil
            }
        }
        while let fastRunnerNext = fastRunner.next,
              let slowRunnerNext = slowRunner.next {
            fastRunner = fastRunnerNext
            slowRunner = slowRunnerNext
        }
        return slowRunner.data
    }
}

extension LinkedList: Equatable where Element: Equatable {
    static func == (lhs: LinkedList<Element>, rhs: LinkedList<Element>) -> Bool {
        (lhs.toArray() == rhs.toArray())
    }
}

extension LinkedList where Element: Equatable {
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
}

extension LinkedList where Element: Hashable {
    func removeDuplicates() {
        guard let head = self.head else {
            return
        }
        var seenElements = Set<Element>()
        seenElements.insert(head.data)
        var optionalCurrentNode: ListNode? = head
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