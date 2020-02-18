//
// Created by Zach Miller on 18/02/2020.
//

struct SetTheory {
    func powerSet<Element>(of superSet: Set<Element>) -> Set<Set<Element>> {
        guard !superSet.isEmpty else {
            return [[]]
        }
        var tail = superSet
        let head = tail.removeFirst()
        let tailPowerSet = self.powerSet(of: tail)
        return tailPowerSet.reduce(into: [], { (accumulator: inout Set<Set<Element>>, setWithoutHead: Set<Element>) in
            let setWithHead = setWithoutHead.union([head])
            accumulator.insert(setWithoutHead)
            accumulator.insert(setWithHead)
        })
    }
}