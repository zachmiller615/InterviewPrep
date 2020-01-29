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
}