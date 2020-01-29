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

    func mergeSort<Element: Comparable>(_ originalArray: [Element]) -> [Element] {
        var resultArray = originalArray
        var helperArray = resultArray
        self.mergeSort(mainArray: &resultArray, helperArray: &helperArray, mainArrayFirstIndex: 0, mainArrayLastIndex: (resultArray.count - 1))
        return resultArray
    }
}

// Private Methods - Merge Sort
private extension Sorter {
    func mergeSort<Element: Comparable>(mainArray: inout [Element], helperArray: inout [Element], mainArrayFirstIndex: Int, mainArrayLastIndex: Int) {
        guard (mainArrayFirstIndex < mainArrayLastIndex) else {
            return
        }
        let leftArrayLastIndex = ((mainArrayFirstIndex + mainArrayLastIndex) / 2)
        self.mergeSort(mainArray: &mainArray, helperArray: &helperArray, mainArrayFirstIndex: mainArrayFirstIndex, mainArrayLastIndex: leftArrayLastIndex)
        self.mergeSort(mainArray: &mainArray, helperArray: &helperArray, mainArrayFirstIndex: (leftArrayLastIndex + 1), mainArrayLastIndex: mainArrayLastIndex)
        self.merge(mainArray: &mainArray, helperArray: &helperArray, leftArrayFirstIndex: mainArrayFirstIndex, leftArrayLastIndex: leftArrayLastIndex, rightArrayLastIndex: mainArrayLastIndex)
    }

    func merge<Element: Comparable>(mainArray: inout [Element], helperArray: inout [Element], leftArrayFirstIndex: Int, leftArrayLastIndex: Int, rightArrayLastIndex: Int) {
        // Copy elements from main array into helper array
        for index in (leftArrayFirstIndex...rightArrayLastIndex) {
            helperArray[index] = mainArray[index]
        }

        // Declare running variables
        var currentLeftArrayIndex = leftArrayFirstIndex
        var currentRightArrayIndex = (leftArrayLastIndex + 1)
        var currentMainArrayIndex = leftArrayFirstIndex

        // Continue iterating while there is what to compare between the left array and right array
        while ((currentLeftArrayIndex <= leftArrayLastIndex) && (currentRightArrayIndex <= rightArrayLastIndex)) {
            let shouldSelectElementFromLeftArray = (helperArray[currentLeftArrayIndex] <= helperArray[currentRightArrayIndex])
            if shouldSelectElementFromLeftArray {
                mainArray[currentMainArrayIndex] = helperArray[currentLeftArrayIndex]
                currentLeftArrayIndex += 1
            } else {
                mainArray[currentMainArrayIndex] = helperArray[currentRightArrayIndex]
                currentRightArrayIndex += 1
            }
            currentMainArrayIndex += 1
        }

        // Copy remaining elements from left array into the main array
        let numberOfRemainingElementsInLeftArray = (leftArrayLastIndex - currentLeftArrayIndex + 1)
        for _ in (0..<numberOfRemainingElementsInLeftArray) {
            mainArray[currentMainArrayIndex] = helperArray[currentLeftArrayIndex]
            currentMainArrayIndex += 1
            currentLeftArrayIndex += 1
        }
    }
}