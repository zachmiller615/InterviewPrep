//
// Created by Zach Miller on 06/03/2020.
//

class AdjacencyMatrix {
    // Properties
    private let edgeDirectionType: EdgeDirectionType
    private let numberOfVertices: Int
    private var matrix: [[Bool]]

    // Initializer
    init(edgeDirectionType: EdgeDirectionType, numberOfVertices: Int) {
        self.edgeDirectionType = edgeDirectionType
        self.numberOfVertices = numberOfVertices
        let matrixRow = Array(repeating: false, count: numberOfVertices)
        self.matrix = Array(repeating: matrixRow, count: numberOfVertices)
    }

    // Methods
    func addEdge(from source: Int, to target: Int) throws {
        guard ((source < numberOfVertices) && (target < numberOfVertices)) else {
            let invalidVertex = (source < numberOfVertices) ? source : target
            let errorMessage = "Vertex \(invalidVertex) must be less than number of vertices of \(self.numberOfVertices)"
            throw AdjacencyMatrixError.invalidVertex(message: errorMessage)
        }
        self.matrix[source][target] = true
        if (self.edgeDirectionType == .undirected) {
            self.matrix[target][source] = true
        }
    }

    func topologicalSort() -> [Int]? {
        var visitedVertices = Set<Int>()
        var visitingVertices = Set<Int>()
        var sortOrderStack = Stack<Int>()
        for vertex in (0..<self.numberOfVertices) {
            do {
                try self.topologicalSort(currentVertex: vertex, visitedVertices: &visitedVertices, visitingVertices: &visitingVertices, sortOrderStack: &sortOrderStack)
            } catch TopologicalSortError.cycleDetected {
                print("Error: cycle detected")
                return nil
            } catch {
                print(error)
                return nil
            }
        }
        var sortOrderArray: [Int] = []
        while !sortOrderStack.isEmpty() {
            if let vertex = sortOrderStack.pop() {
                sortOrderArray.append(vertex)
            }
        }
        return sortOrderArray
    }
}

// Private Methods
private extension AdjacencyMatrix {
    func topologicalSort(currentVertex: Int, visitedVertices: inout Set<Int>, visitingVertices: inout Set<Int>, sortOrderStack: inout Stack<Int>) throws {
        if visitedVertices.contains(currentVertex) {
            return
        } else if visitingVertices.contains(currentVertex) {
            throw TopologicalSortError.cycleDetected
        }
        visitingVertices.insert(currentVertex)
        let neighbors = self.getNeighbors(of: currentVertex)
        for neighbor in neighbors {
            try topologicalSort(currentVertex: neighbor, visitedVertices: &visitedVertices, visitingVertices: &visitingVertices, sortOrderStack: &sortOrderStack)
        }
        visitedVertices.insert(currentVertex)
        visitingVertices.remove(currentVertex)
        sortOrderStack.push(currentVertex)
    }

    func getNeighbors(of vertex: Int) -> [Int] {
        var neighbors: [Int] = []
        for (index, edgeExists) in self.matrix[vertex].enumerated() {
            if edgeExists {
                neighbors.append(index)
            }
        }
        return neighbors
    }
}