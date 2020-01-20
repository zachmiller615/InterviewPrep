//
// Created by Zach Miller on 20/01/2020.
//

class Stack<T> {
    // Properties
    private var top: ListNode<T>?

    // Methods
    func isEmpty() -> Bool {
        (self.top == nil)
    }

    func push(_ data: T) {
        let newNode = ListNode(data: data)
        newNode.next = self.top
        self.top = newNode
    }

    func pop() -> T? {
        let data = self.top?.data
        self.top = self.top?.next
        return data
    }

    func peek() -> T? {
        self.top?.data
    }
}
