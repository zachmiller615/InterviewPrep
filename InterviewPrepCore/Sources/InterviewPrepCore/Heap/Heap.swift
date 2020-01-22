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
        let elementIndex = (self.data.count - 1)
        let parentIndex = self.parentIndex(childIndex: elementIndex)
        let elementShouldSwimUp = self.elementShouldSwimUp(element: element, parentIndex: parentIndex)
        if elementShouldSwimUp {
            self.swapElements(index1: elementIndex, index2: parentIndex)
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

    func elementShouldSwimUp(element: ElementType, parentIndex: Int) -> Bool {
        switch self.type {
        case .min:
            return (element < self.data[parentIndex])
        case .max:
            return (element > self.data[parentIndex])
        }
    }

    func parentIndex(childIndex: Int) -> Int {
        let potentialParentIndex = (childIndex / 2)
        return potentialParentIndex
    }
}





















































