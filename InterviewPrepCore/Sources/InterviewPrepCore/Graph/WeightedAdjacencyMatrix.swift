//
// Created by Zach Miller on 07/03/2020.
//

class WeightedAdjacencyMatrix {
    // Properties
    private let edgeDirectionType: EdgeDirectionType
    private let numberOfVertices: Int
    private var matrix: [[Double?]]

    // Initializer
    init(edgeDirectionType: EdgeDirectionType, numberOfVertices: Int) {
        self.edgeDirectionType = edgeDirectionType
        self.numberOfVertices = numberOfVertices
        let matrixRow: [Double?] = Array(repeating: nil, count: numberOfVertices)
        self.matrix = Array(repeating: matrixRow, count: numberOfVertices)
    }

    // Methods
    func addEdge(source: Int, target: Int, weight: Double) throws {
        guard ((source < numberOfVertices) && (target < numberOfVertices)) else {
            let invalidVertex = (source < numberOfVertices) ? target : source
            let errorMessage = "Vertex \(invalidVertex) must be less than number of vertices of \(self.numberOfVertices)"
            throw AdjacencyMatrixError.invalidVertex(message: errorMessage)
        }
        self.matrix[source][target] = weight
        if (self.edgeDirectionType == .undirected) {
            self.matrix[target][source] = weight
        }
    }

    func findMinimumPath(from source: Int, to target: Int) -> (path: [Int], distance: Double)? {
        // Initialization
        var previousNodes: [Int?] = Array(repeating: nil, count: self.numberOfVertices)
        var pathWeights = Array(repeating: Double.infinity, count: self.numberOfVertices)
        pathWeights[source] = 0
        let remainingElements = Heap<DijkstrasAlgorithmHeapElement>(type: .min)
        for (vertex, pathWeight) in pathWeights.enumerated() {
            let heapElement = DijkstrasAlgorithmHeapElement(vertex: vertex, pathWeight: pathWeight)
            remainingElements.push(heapElement)
        }
        var removedVertices = Set<Int>()

        // Graph traversal
        var optionalCurrentHeapElement = remainingElements.poll()
        while let currentHeapElement = optionalCurrentHeapElement {
            let currentVertex = currentHeapElement.vertex
            if (removedVertices.contains(currentVertex)) {
                optionalCurrentHeapElement = remainingElements.poll()
                continue // Due to the unideal way of updating heap elements below, the current vertex could be outdated.
            }
            let neighbors = self.getNeighbors(of: currentVertex)
            for neighbor in neighbors {
                if removedVertices.contains(neighbor) {
                    continue // A shorter path to neighbor already exists.
                }
                let edgeWeight = self.matrix[currentVertex][neighbor]!
                let potentialDistance = (currentHeapElement.pathWeight + edgeWeight)
                if (potentialDistance < pathWeights[neighbor]) {
                    pathWeights[neighbor] = potentialDistance
                    previousNodes[neighbor] = currentVertex

                    /*
                    Update path weight inside the heap:
                    Ideally, the min heap should support a decreaseKey operation.
                    This solution leaves outdated elements inside the heap.
                    It does not affect correctness because the updated elements will get polled before outdated elements, since the path weight is decreasing.
                    It does, however, affect performance because the heap now contains extra elements.
                    */
                    let updatedHeapElement = DijkstrasAlgorithmHeapElement(vertex: neighbor, pathWeight: potentialDistance)
                    remainingElements.push(updatedHeapElement)
                }
            }
            removedVertices.insert(currentVertex)
            optionalCurrentHeapElement = remainingElements.poll()
        }

        // Discover path
        let pathStack = Stack<Int>()
        var currentVertex = target
        pathStack.push(currentVertex)
        while (currentVertex != source) {
            if let previousVertex = previousNodes[currentVertex] {
                pathStack.push(previousVertex)
                currentVertex = previousVertex
            } else {
                break
            }
        }
        var pathArray: [Int] = []
        while !pathStack.isEmpty() {
            if let vertex = pathStack.pop() {
                pathArray.append(vertex)
            }
        }
        guard (!pathArray.isEmpty && (pathArray[0] == source)) else {
            return nil
        }
        return (path: pathArray, distance: pathWeights[target])
    }
}

// Private Methods
private extension WeightedAdjacencyMatrix {
    func getNeighbors(of vertex: Int) -> [Int] {
        var neighbors: [Int] = []
        for (index, weight) in self.matrix[vertex].enumerated() {
            if (weight != nil) {
                neighbors.append(index)
            }
        }
        return neighbors
    }
}