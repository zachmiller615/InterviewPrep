//
// Created by Zach Miller on 19/01/2020.
//

class Graph<Element> where Element: Hashable {
    // Properties
    private let directionType: EdgeDirectionType
    private var vertices = Set<Vertex<Element>>()

    // Initializer
    init(directionType: EdgeDirectionType) {
        self.directionType = directionType
    }

    // Methods
    func addEdge(from sourceData: Element, to targetData: Element?) {
        let sourceVertex = self.getVertex(withData: sourceData) ?? Vertex(data: sourceData)
        self.vertices.insert(sourceVertex)
        if let targetData = targetData {
            let targetVertex = self.getVertex(withData: targetData) ?? Vertex(data: targetData)
            self.vertices.insert(targetVertex)
            sourceVertex.neighbors.insert(targetVertex)
            if (self.directionType == .undirected) {
                targetVertex.neighbors.insert(sourceVertex)
            }
        }
    }

    func hasPath_DepthFirstSearch(from sourceData: Element, to targetData: Element) -> Bool {
        if let sourceVertex = self.getVertex(withData: sourceData), let targetVertex = self.getVertex(withData: targetData) {
            var visitedVertices = Set<Vertex<Element>>()
            return self.hasPath_DepthFirstSearch_Recursive(from: sourceVertex, to: targetVertex, visitedVertices: &visitedVertices)
        } else {
            return false
        }
    }

    func hasPath_BreadthFirstSearch(from sourceData: Element, to targetData: Element) -> Bool {
        guard let sourceVertex = self.getVertex(withData: sourceData), let targetVertex = self.getVertex(withData: targetData) else {
            return false
        }
        var visitedVertices = Set<Vertex<Element>>()
        let verticesToProcess = Queue<Vertex<Element>>()
        verticesToProcess.enqueue(sourceVertex)
        while (!verticesToProcess.isEmpty()) {
            guard let currentVertex = verticesToProcess.dequeue() else {
                break
            }
            if (currentVertex == targetVertex) {
                return true
            }
            if (visitedVertices.contains(currentVertex)) {
                continue
            }
            visitedVertices.insert(currentVertex)
            for neighbor in currentVertex.neighbors {
                verticesToProcess.enqueue(neighbor)
            }
        }
        return false
    }
}

// Private Methods
private extension Graph {
    func getVertex(withData data: Element) -> Vertex<Element>? {
        self.vertices.first {
            $0.data == data
        }
    }

    func hasPath_DepthFirstSearch_Recursive(from currentVertex: Vertex<Element>, to targetVertex: Vertex<Element>, visitedVertices: inout Set<Vertex<Element>>) -> Bool {
        if (currentVertex == targetVertex) {
            return true
        }
        if visitedVertices.contains(currentVertex) {
            return false
        }
        visitedVertices.insert(currentVertex)
        for neighbor in currentVertex.neighbors {
            if self.hasPath_DepthFirstSearch_Recursive(from: neighbor, to: targetVertex, visitedVertices: &visitedVertices) {
                return true
            }
        }
        return false
    }
}

// Vertex Class
private class Vertex<T> where T: Hashable {
    // Properties
    let data: T
    var neighbors = Set<Vertex<T>>()

    // Initializer
    init(data: T) {
        self.data = data
    }
}

// Vertex Hashable Extension
extension Vertex: Hashable {
    static func ==(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        lhs.data == rhs.data
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.data)
    }
}

// Graph Debug Representation
extension Graph: CustomDebugStringConvertible {
    var debugDescription: String {
        var description = "Graph:"
        for vertex in self.vertices {
            description += "\n\(vertex.data):"
            for neighbor in vertex.neighbors {
                description += " \(neighbor.data),"
            }
            if (description.last == ",") {
                description.removeLast()
            }
        }
        return description
    }
}