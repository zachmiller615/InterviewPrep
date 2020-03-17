//
// Created by Zach Miller on 18/02/2020.
//

struct DiscreteMath {
    // Methods
    func powerSet<Element>(of superSet: Set<Element>) -> Set<Set<Element>> {
        guard !superSet.isEmpty else {
            return [[]]
        }
        var tail = superSet
        let head = tail.removeFirst()
        let tailPowerSet = self.powerSet(of: tail)
        return tailPowerSet.reduce(into: []) { (accumulator: inout Set<Set<Element>>, setWithoutHead: Set<Element>) in
            let setWithHead = setWithoutHead.union([head])
            accumulator.insert(setWithoutHead)
            accumulator.insert(setWithHead)
        }
    }

    func permutations<Element>(of inputArray: [Element]) -> Set<[Element]> {
        if inputArray.isEmpty {
            return [[]]
        }
        if (inputArray.count == 1) {
            return [inputArray]
        }
        var tail = inputArray
        let head = tail.removeFirst()
        let tailPermutations = self.permutations(of: tail)
        return tailPermutations.reduce(into: []) { (accumulator: inout Set<[Element]>, permutationWithoutHead: [Element]) in
            let permutationsWithHead = self.insertIntoEachLocation(elementToInsert: head, otherElements: permutationWithoutHead)
            for permutationWithHead in permutationsWithHead {
                accumulator.insert(permutationWithHead)
            }
        }
    }
}

// Private Methods
private extension DiscreteMath {
    func insertIntoEachLocation<Element>(elementToInsert: Element, otherElements: [Element]) -> Set<[Element]> {
        let indexRange = (otherElements.startIndex...otherElements.endIndex)
        var result = Set<[Element]>()
        for middleIndex in indexRange {
            let newArraySlice = otherElements[otherElements.startIndex..<middleIndex] + [elementToInsert] + otherElements[middleIndex..<otherElements.endIndex]
            let newArray = Array(newArraySlice)
            result.insert(newArray)
        }
        return result
    }
}