//
// Created by Zach Miller on 29/01/2020.
//

struct Sorter {
    // Type Aliases
    typealias CountingSortKeyExtractor<Element> = (Element) -> Int

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

    func quickSort<Element: Comparable>(_ originalArray: [Element]) -> [Element] {
        var resultArray = originalArray
        self.quickSort(mainArray: &resultArray, mainArrayFirstIndex: 0, mainArrayLastIndex: (resultArray.count - 1))
        return resultArray
    }

    func countingSort<Element>(array originalArray: [Element], keyExtractor: CountingSortKeyExtractor<Element>, keyRange: ClosedRange<Int>) -> [Element]? {
        // Validate input
        for element in originalArray {
            let key = keyExtractor(element)
            if (!keyRange.contains(key)) {
                return nil
            }
        }

        var resultIndexIndicator = Array(repeating: 0, count: keyRange.count)
        var resultArray: [Element?] = Array(repeating: nil, count: originalArray.count)

        // Set up result index indicator
        for element in originalArray {
            let index = (keyExtractor(element) - keyRange.lowerBound)
            resultIndexIndicator[index] += 1
        }
        for index in (1..<resultIndexIndicator.count) {
            resultIndexIndicator[index] = (resultIndexIndicator[index - 1] + resultIndexIndicator[index])
        }
        resultIndexIndicator.insert(0, at: 0)

        // Fill result array
        for element in originalArray {
            let indexForIndicatorArray = (keyExtractor(element) - keyRange.lowerBound)
            let indexForResultArray = resultIndexIndicator[indexForIndicatorArray]
            resultArray[indexForResultArray] = element
            resultIndexIndicator[indexForIndicatorArray] += 1
        }

        return (resultArray.compactMap {
            $0
        })
    }
}

// Private Methods - Merge Sort
private extension Sorter {
    func mergeSort<Element: Comparable>(mainArray: inout [Element], helperArray: inout [Element], mainArrayFirstIndex: Int, mainArrayLastIndex: Int) {
        guard (mainArrayFirstIndex < mainArrayLastIndex) else {
            return
        }
        let leftArrayLastIndex = ((mainArrayFirstIndex + mainArrayLastIndex) / 2)
        self.mergeSort(mainArray: &mainArray, helperArray: &helperArray, mainArrayFirstIndex: mainArrayFirstIndex, mainArrayLastIndex: leftArrayLastIndex) // Sort the left half
        self.mergeSort(mainArray: &mainArray, helperArray: &helperArray, mainArrayFirstIndex: (leftArrayLastIndex + 1), mainArrayLastIndex: mainArrayLastIndex) // Sort the right half
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

// Private Methods - Quick Sort
private extension Sorter {
    func quickSort<Element: Comparable>(mainArray: inout [Element], mainArrayFirstIndex: Int, mainArrayLastIndex: Int) {
        let rightArrayFirstIndex = self.partition(mainArray: &mainArray, mainArrayFirstIndex: mainArrayFirstIndex, mainArrayLastIndex: mainArrayLastIndex)
        let leftArrayLastIndex = (rightArrayFirstIndex - 1)
        let leftArrayHasMultipleElements = (mainArrayFirstIndex < leftArrayLastIndex)
        let rightArrayHasMultipleElements = (rightArrayFirstIndex < mainArrayLastIndex)
        if leftArrayHasMultipleElements {
            // Sort the left side of the partition
            self.quickSort(mainArray: &mainArray, mainArrayFirstIndex: mainArrayFirstIndex, mainArrayLastIndex: leftArrayLastIndex)
        }
        if rightArrayHasMultipleElements {
            // Sort the right side of the partition
            self.quickSort(mainArray: &mainArray, mainArrayFirstIndex: rightArrayFirstIndex, mainArrayLastIndex: mainArrayLastIndex)
        }
    }

    func partition<Element: Comparable>(mainArray: inout [Element], mainArrayFirstIndex: Int, mainArrayLastIndex: Int) -> Int {
        let pivotIndex = self.getPivotIndex(arrayFirstIndex: mainArrayFirstIndex, arrayLastIndex: mainArrayLastIndex)
        let pivotValue = mainArray[pivotIndex]

        // Declare running variables
        var currentLeftArrayIndex = mainArrayFirstIndex
        var currentRightArrayIndex = mainArrayLastIndex

        // Continue iterating while the left and right current indices have not crossed each other
        while (currentLeftArrayIndex <= currentRightArrayIndex) {
            // Find element from left side that is out of place
            while (mainArray[currentLeftArrayIndex] < pivotValue) {
                currentLeftArrayIndex += 1
            }

            // Find element from right side that is out of place
            while (mainArray[currentRightArrayIndex] > pivotValue) {
                currentRightArrayIndex -= 1
            }

            if (currentLeftArrayIndex <= currentRightArrayIndex) {
                mainArray.swapElements(index1: currentLeftArrayIndex, index2: currentRightArrayIndex)
                currentLeftArrayIndex += 1
                currentRightArrayIndex -= 1
            }
        }

        return currentLeftArrayIndex
    }

    func getPivotIndex(arrayFirstIndex: Int, arrayLastIndex: Int) -> Int {
        ((arrayFirstIndex + arrayLastIndex) / 2)
    }
}