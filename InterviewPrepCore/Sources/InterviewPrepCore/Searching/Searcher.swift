//
// Created by Zach Miller on 30/01/2020.
//

struct Searcher {
    // Methods
    func binarySearchIterative<Element: Comparable>(sortedArray: [Element], target: Element) -> Int? {
        var low = 0
        var high = (sortedArray.count - 1)
        var middle = ((low + high) / 2)
        while (low <= high) {
            middle = ((low + high) / 2)
            if (target < sortedArray[middle]) {
                high = (middle - 1) // Search left
            } else if (target > sortedArray[middle]) {
                low = (middle + 1) // Search right
            } else {
                return middle
            }
        }
        return nil
    }

    func binarySearchRecursive<Element: Comparable>(sortedArray: [Element], target: Element) -> Int? {
        self.binarySearchRecursive(sortedArray: sortedArray, target: target, low: 0, high: (sortedArray.count - 1))
    }
}

// Private Methods
private extension Searcher {
    func binarySearchRecursive<Element: Comparable>(sortedArray: [Element], target: Element, low: Int, high: Int) -> Int? {
        guard (low <= high) else {
            return nil
        }
        let middle = ((low + high) / 2)
        if (target < sortedArray[middle]) {
            return self.binarySearchRecursive(sortedArray: sortedArray, target: target, low: 0, high: (middle - 1)) // Search left
        } else if (target > sortedArray[middle]) {
            return self.binarySearchRecursive(sortedArray: sortedArray, target: target, low: (middle + 1), high: high) // Search right
        } else {
            return middle
        }
    }
}