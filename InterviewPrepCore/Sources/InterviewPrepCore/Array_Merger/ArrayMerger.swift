//
// Created by Zach Miller on 16/02/2020.
//

struct ArrayMerger {
    // Methods
    func combinationsKeepingRespectiveOrders<Element>(array1: [Element], array2: [Element]) -> [[Element]] {
        guard (!array1.isEmpty || !array2.isEmpty) else {
            return []
        }
        return self.orderCombinationsHelper(array1: array1, array2: array2, combinationArray: [])
    }
}

// Private Methods
private extension ArrayMerger {
    func orderCombinationsHelper<Element>(array1: [Element], array2: [Element], combinationArray: [Element]) -> [[Element]] {
        if (array1.isEmpty && array2.isEmpty) {
            return [combinationArray]
        }

        var resultFromPoppingArray1: [[Element]] = []
        var resultFromPoppingArray2: [[Element]] = []

        if !array1.isEmpty {
            var array1Copy = array1
            let array1First = array1Copy.removeFirst()
            resultFromPoppingArray1 = self.orderCombinationsHelper(array1: array1Copy, array2: array2, combinationArray: (combinationArray + [array1First]))
        }

        if !array2.isEmpty {
            var array2Copy = array2
            let array2First = array2Copy.removeFirst()
            resultFromPoppingArray2 = self.orderCombinationsHelper(array1: array1, array2: array2Copy, combinationArray: (combinationArray + [array2First]))
        }

        return (resultFromPoppingArray1 + resultFromPoppingArray2)
    }
}