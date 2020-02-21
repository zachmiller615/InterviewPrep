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

    func permutations<Element>(of inputSet: Set<Element>) -> [[Element]] {
        if inputSet.isEmpty {
            return [[]]
        }
        if (inputSet.count == 1) {
            return [Array(inputSet)]
        }
        var tail = inputSet
        let head = tail.removeFirst()
        let tailPermutations = self.permutations(of: tail)
        return tailPermutations.reduce(into: []) { (accumulator: inout [[Element]], permutationWithoutHead: [Element]) in
            let permutationsWithHead = self.insertIntoEachLocation(elementToInsert: head, otherElements: permutationWithoutHead)
            accumulator.append(contentsOf: permutationsWithHead)
        }
    }
}

// Private Methods
private extension DiscreteMath {
    func insertIntoEachLocation<Element>(elementToInsert: Element, otherElements: [Element]) -> [[Element]] {
        let indexRange = (otherElements.startIndex...otherElements.endIndex)
        return indexRange.map { middleIndex in
            let newArraySlice = otherElements[otherElements.startIndex..<middleIndex] + [elementToInsert] + otherElements[middleIndex..<otherElements.endIndex]
            return Array(newArraySlice)
        }
    }
}