//
// Created by Zach Miller on 02/02/2020.
//

class StackWithMin<Element: Comparable>: Stack<Element> {
    // Properties
    private let minHistory = Stack<Element>()

    // Methods
    override func push(_ data: Element) {
        super.push(data)
        let newDataIsMin = ((self.minHistory.peek() != nil) && (data <= self.minHistory.peek()!))
        if (self.minHistory.isEmpty() || newDataIsMin) {
            self.minHistory.push(data)
        }
    }

    @discardableResult
    override func pop() -> Element? {
        let poppedData = super.pop()
        if (poppedData == self.minHistory.peek()) {
            self.minHistory.pop()
        }
        return poppedData
    }

    func min() -> Element? {
        self.minHistory.peek()
    }
}