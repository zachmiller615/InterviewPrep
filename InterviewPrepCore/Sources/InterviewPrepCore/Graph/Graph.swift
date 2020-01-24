//
// Created by Zach Miller on 19/01/2020.
//

class Graph<Element> where Element: Hashable {
    // Properties
    private var vertices = Set<Vertex<Element>>()

    // Methods
    func addEdge(item1: Element, item2: Element?) {
        let vertex1 = self.getVertex(withData: item1) ?? Vertex(data: item1)
        self.vertices.insert(vertex1)
        if let item2 = item2 {
            let vertex2 = self.getVertex(withData: item2) ?? Vertex(data: item2)
            vertex1.neighbors.insert(vertex2)
            vertex2.neighbors.insert(vertex1)
            self.vertices.insert(vertex2)
        }
    }

    func hasPath_DepthFirstSearch(source: Element, target: Element) -> Bool {
        if let sourceVertex = self.getVertex(withData: source), let targetVertex = self.getVertex(withData: target) {
            var visitedVertices = Set<Vertex<Element>>()
            return self.hasPath_DepthFirstSearch_Recursive(currentVertex: sourceVertex, targetVertex: targetVertex, visitedVertices: &visitedVertices)
        } else {
            return false
        }
    }

    func hasPath_BreadthFirstSearch(source: Element, target: Element) -> Bool {
        guard let sourceVertex = self.getVertex(withData: source), let targetVertex = self.getVertex(withData: target) else {
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

    func hasPath_DepthFirstSearch_Recursive(currentVertex: Vertex<Element>, targetVertex: Vertex<Element>, visitedVertices: inout Set<Vertex<Element>>) -> Bool {
        if (currentVertex == targetVertex) {
            return true
        }
        if visitedVertices.contains(currentVertex) {
            return false
        }
        visitedVertices.insert(currentVertex)
        for neighbor in currentVertex.neighbors {
            if self.hasPath_DepthFirstSearch_Recursive(currentVertex: neighbor, targetVertex: targetVertex, visitedVertices: &visitedVertices) {
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