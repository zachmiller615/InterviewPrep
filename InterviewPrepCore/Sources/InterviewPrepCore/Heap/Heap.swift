//
// Created by Zach Miller on 22/01/2020.
//

class Heap<ElementType> where ElementType: Comparable {
    // Properties
    private let type: HeapType
    private var data: [ElementType] = []

    // Initializer
    init(type: HeapType) {
        self.type = type
    }

    // Methods
    func isEmpty() -> Bool {
        self.data.isEmpty
    }

    func peek() -> ElementType? {
        self.data.first
    }

    func push(_ element: ElementType) {
        self.data.append(element)
        var childIndex = (self.data.count - 1)
        var parentIndex = self.parentIndex(childIndex: childIndex)
        while (self.parentExists(childIndex: childIndex) &&
                self.heapInvariantIsBroken(childIndex: childIndex, parentIndex: parentIndex)) {
            self.data.swapElements(index1: childIndex, index2: parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(childIndex: childIndex)
        }
    }

    func poll() -> ElementType? {
        guard !self.data.isEmpty else {
            return nil
        }
        let elementToReturn = self.data.first
        let lastElement = self.data.removeLast()
        if (self.data.isEmpty) {
            return elementToReturn
        }
        self.data[0] = lastElement
        var parentIndex = 0
        var leftChildIndex = self.leftChildIndex(parentIndex: parentIndex)
        var rightChildIndex = self.rightChildIndex(parentIndex: parentIndex)
        while (self.leftChildExists(parentIndex: parentIndex)) {
            guard let preferredChildIndex = self.preferredChildIndexForSinkDown(leftChildIndex: leftChildIndex, rightChildIndex: rightChildIndex) else {
                break
            }
            if self.heapInvariantIsBroken(childIndex: preferredChildIndex, parentIndex: parentIndex) {
                self.data.swapElements(index1: preferredChildIndex, index2: parentIndex)
                parentIndex = preferredChildIndex
                leftChildIndex = self.leftChildIndex(parentIndex: parentIndex)
                rightChildIndex = self.rightChildIndex(parentIndex: parentIndex)
            } else {
                break
            }
        }
        return elementToReturn
    }
}

// Private Methods
private extension Heap {
    func heapInvariantIsBroken(childIndex: Int, parentIndex: Int) -> Bool {
        guard (self.data.indexIsValid(childIndex) && self.data.indexIsValid(parentIndex)) else {
            return false
        }
        switch self.type {
        case .min:
            return (self.data[childIndex] < self.data[parentIndex])
        case .max:
            return (self.data[childIndex] > self.data[parentIndex])
        }
    }

    func preferredChildIndexForSinkDown(leftChildIndex: Int, rightChildIndex: Int) -> Int? {
        if (!self.data.indexIsValid(leftChildIndex)) {
            return nil
        } else if (!self.data.indexIsValid(rightChildIndex)) {
            return leftChildIndex
        }
        let leftChildIsPreferred: Bool
        switch self.type {
        case .min:
            leftChildIsPreferred = (self.data[leftChildIndex] < self.data[rightChildIndex])
        case .max:
            leftChildIsPreferred = (self.data[leftChildIndex] > self.data[rightChildIndex])
        }
        return leftChildIsPreferred ? leftChildIndex : rightChildIndex
    }

    func parentIndex(childIndex: Int) -> Int {
        ((childIndex - 1) / 2)
    }

    func leftChildIndex(parentIndex: Int) -> Int {
        (parentIndex * 2 + 1)
    }

    func rightChildIndex(parentIndex: Int) -> Int {
        (parentIndex * 2 + 2)
    }

    func parentExists(childIndex: Int) -> Bool {
        let potentialParentIndex = self.parentIndex(childIndex: childIndex)
        return ((childIndex > 0) && self.data.indexIsValid(potentialParentIndex))
    }

    func leftChildExists(parentIndex: Int) -> Bool {
        let potentialLeftChildIndex = self.leftChildIndex(parentIndex: parentIndex)
        return self.data.indexIsValid(potentialLeftChildIndex)
    }

    func rightChildExists(parentIndex: Int) -> Bool {
        let potentialRightChildIndex = self.rightChildIndex(parentIndex: parentIndex)
        return self.data.indexIsValid(potentialRightChildIndex)
    }
}