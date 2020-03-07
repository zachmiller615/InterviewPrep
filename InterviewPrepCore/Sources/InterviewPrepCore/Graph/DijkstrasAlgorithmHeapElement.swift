//
// Created by Zach Miller on 07/03/2020.
//

struct DijkstrasAlgorithmHeapElement {
    let vertex: Int
    let pathWeight: Double
}

extension DijkstrasAlgorithmHeapElement: Comparable {
    static func <(lhs: DijkstrasAlgorithmHeapElement, rhs: DijkstrasAlgorithmHeapElement) -> Bool {
        (lhs.pathWeight < rhs.pathWeight)
    }
}