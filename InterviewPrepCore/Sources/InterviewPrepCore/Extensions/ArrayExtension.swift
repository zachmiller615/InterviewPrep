//
// Created by Zach Miller on 22/01/2020.
//

extension Array {
    func indexIsValid(_ index: Int) -> Bool {
        ((index >= 0) && (index < self.count))
    }

    mutating func swapElements(index1: Int, index2: Int) {
        guard (self.indexIsValid(index1) && self.indexIsValid(index2)) else {
            return
        }
        let originalValueAtIndex1 = self[index1]
        self[index1] = self[index2]
        self[index2] = originalValueAtIndex1
    }

    func mapSort<MapResult: Comparable>(mapCallback: (Element) -> MapResult) -> [Element] {
        self.enumerated()
                .map {
                    (index: $0, value: mapCallback($1))
                }
                .sorted {
                    $0.value < $1.value
                }
                .map {
                    self[$0.index]
                }
    }
}