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
        guard (!self.data.isEmpty) else {
            self.data.append(element)
            return
        }


    }
}























































