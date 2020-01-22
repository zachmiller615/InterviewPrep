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
    func peek() -> ElementType? {
        self.data.first
    }

    func add(_ element: ElementType) {
        self.data.append(element)

        var currentIndex = (self.data.count - 1)
        while (self.parentExists(childIndex: currentIndex) &&
                self.elementShouldSwimUp(
                        childIndex: currentIndex,
                        parentIndex: self.parentIndex(childIndex: currentIndex))) {
            let parentIndex = self.parentIndex(childIndex: currentIndex)
            self.swapElements(index1: currentIndex, index2: parentIndex)
            currentIndex = parentIndex
        }
    }
}

// Private Methods
private extension Heap {
    func swapElements(index1: Int, index2: Int) {
        guard (self.data.indexIsValid(index1) && self.data.indexIsValid(index2)) else {
            return
        }
        let originalValueAtIndex1 = self.data[index1]
        self.data[index1] = self.data[index2]
        self.data[index2] = originalValueAtIndex1
    }

    func elementShouldSwimUp(childIndex: Int, parentIndex: Int) -> Bool {
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

    func parentExists(childIndex: Int) -> Bool {
        let potentialParentIndex = self.parentIndex(childIndex: childIndex)
        return ((childIndex > 0) && self.data.indexIsValid(potentialParentIndex))
    }

    func parentIndex(childIndex: Int) -> Int {
        ((childIndex - 1) / 2)
    }
}
