//
// Created by Zach Miller on 15/02/2020.
//

/// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
/// You are given an array-like data structure Listy which lacks a size method.
/// It does, however, have an elementAt(i) method that returns the element at index i in O(1) time.
/// Given a Listy which contains sorted data, find the index at which an element x occurs.
/// If x occurs multiple times, you may return any index.
struct Listy<Element: Comparable> {
    // Properties
    private let data: [Element]

    // Initializer
    init(data: [Element]) {
        self.data = data.sorted()
    }

    // Methods
    func indexOfElement(_ targetElement: Element) -> Int? {
        var lowIndex = 0
        var highIndex = (self.getApproximateSize() - 1)
        var middleIndex = ((lowIndex + highIndex) / 2)
        while (lowIndex <= highIndex) {
            middleIndex = ((lowIndex + highIndex) / 2)
            guard let middleElement = self.elementAt(index: middleIndex) else {
                highIndex = (middleIndex - 1) // Go left
                continue
            }
            if (targetElement == middleElement) {
                return middleIndex
            } else if (targetElement < middleElement) {
                highIndex = (middleIndex - 1) // Go left
            } else {
                lowIndex = (middleIndex + 1) // Go right
            }
        }
        return nil
    }
}

// Private Methods
private extension Listy {
    func elementAt(index: Int) -> Element? {
        if (index < self.data.count) {
            return self.data[index]
        }
        return nil
    }

    func getApproximateSize() -> Int {
        var approximateSize = 1
        while (self.elementAt(index: approximateSize) != nil) {
            approximateSize *= 2
        }
        return approximateSize
    }
}