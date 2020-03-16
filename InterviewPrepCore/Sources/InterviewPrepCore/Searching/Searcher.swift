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
            if (target == sortedArray[middle]) {
                return middle
            } else if (target < sortedArray[middle]) {
                high = (middle - 1) // Search left
            } else {
                low = (middle + 1) // Search right
            }
        }
        return nil
    }

    func binarySearchRecursive<Element: Comparable>(sortedArray: [Element], target: Element) -> Int? {
        self.binarySearchRecursive(sortedArray: sortedArray, target: target, low: 0, high: (sortedArray.count - 1))
    }

    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// Given a sorted array of n integers that has been rotated an unknown number of times, write code to find an element in the array.
    /// You may assume that the array was originally sorted in increasing order.
    func searchInRotatedArray<Element: Comparable>(_ array: [Element], target: Element) -> Int? {
        var low = 0
        var high = (array.count - 1)
        var middle = ((low + high) / 2)
        while (low <= high) {
            middle = ((low + high) / 2)
            if (array[middle] == target) {
                return middle
            }
            let shouldSearchLeft: Bool
            let rotationPointIsLeft = (array[low] > array[middle])
            if (rotationPointIsLeft) {
                let targetFitsOnRightSide = ((array[middle] < target) && (target <= array[high]))
                shouldSearchLeft = !targetFitsOnRightSide
            } else {
                let targetFitsOnLeftSide = ((array[low] <= target) && (target < array[middle]))
                shouldSearchLeft = targetFitsOnLeftSide
            }
            if shouldSearchLeft {
                high = (middle - 1)
            } else {
                low = (middle + 1)
            }
        }
        return nil
    }

    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// A magic index in an array A[0...n-1] is defined to be an index such that A[i] = i.
    /// Given a sorted array of distinct integers, write a method to find a magic index, if one exists, in array A.
    func findMagicIndex(in sortedArray: [Int]) -> Int? {
        var low = 0
        var high = (sortedArray.count - 1)
        var middle = ((low + high) / 2)
        while (low <= high) {
            middle = ((low + high) / 2)
            if (sortedArray[middle] == middle) {
                return middle
            } else if (sortedArray[middle] > middle) {
                high = (middle - 1) // Search left
            } else {
                low = (middle + 1) // Search right
            }
        }
        return nil // No magic index found
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
        }
        if (target > sortedArray[middle]) {
            return self.binarySearchRecursive(sortedArray: sortedArray, target: target, low: (middle + 1), high: high) // Search right
        }
        return middle
    }
}