//
// Created by Zach Miller on 20/01/2020.
//

class Queue<T> {
    // Properties
    private var head: ListNode<T>?
    private var tail: ListNode<T>?

    // Methods
    func isEmpty() -> Bool {
        (self.head == nil)
    }

    func enqueue(_ data: T) {
        let newNode = ListNode(data: data)
        guard let _ = self.head, let tail = self.tail else {
            self.head = newNode
            self.tail = newNode
            return
        }
        tail.next = newNode
        self.tail = newNode
    }

    func dequeue() -> T? {
        let data = self.head?.data
        self.head = self.head?.next
        if (self.head == nil) {
            self.tail = nil
        }
        return data
    }

    func peek() -> T? {
        self.head?.data
    }
}
