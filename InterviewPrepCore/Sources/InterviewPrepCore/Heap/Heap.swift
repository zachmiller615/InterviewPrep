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

        } else {

        }
    }
}

// Private Methods
private extension Heap {
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





















































