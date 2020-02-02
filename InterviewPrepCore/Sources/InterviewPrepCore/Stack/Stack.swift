//
// Created by Zach Miller on 20/01/2020.
//

class Stack<Element> {
    // Properties
    private var top: ListNode<Element>?

    // Methods
    func isEmpty() -> Bool {
        (self.top == nil)
    }

    func push(_ data: Element) {
        let newNode = ListNode(data: data)
        newNode.next = self.top
        self.top = newNode
    }

    @discardableResult
    func pop() -> Element? {
        let data = self.top?.data
        self.top = self.top?.next
        return data
    }

    func peek() -> Element? {
        self.top?.data
    }
}