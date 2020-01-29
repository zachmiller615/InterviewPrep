//
// Created by Zach Miller on 29/01/2020.
//

struct Sorter {
    // Methods
    func bubbleSort<Element: Comparable>(_ originalArray: [Element]) -> [Element] {
        var resultArray = originalArray
        var unsortedEndIndex = (resultArray.count - 1)
        var isSorted = false
        while (!isSorted) {
            isSorted = true
            for index in (0..<unsortedEndIndex) {
                if (resultArray[index] > resultArray[index + 1]) {
                    resultArray.swapElements(index1: index, index2: (index + 1))
                    isSorted = false
                }
            }
            unsortedEndIndex -= 1
        }
        return resultArray
    }

    func selectionSort<Element: Comparable>(_ originalArray: [Element]) -> [Element] {
        var resultArray = originalArray
        for outerLoopIndex in (0..<resultArray.count) {
            var currentMinimumIndex = outerLoopIndex
            for innerLoopIndex in (outerLoopIndex..<resultArray.count) {
                if (resultArray[innerLoopIndex] < resultArray[currentMinimumIndex]) {
                    currentMinimumIndex = innerLoopIndex
                }
            }
            if (currentMinimumIndex != outerLoopIndex) {
                resultArray.swapElements(index1: outerLoopIndex, index2: currentMinimumIndex)
            }
        }
        return resultArray
    }
}