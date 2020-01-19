//
// Created by Zach Miller on 19/01/2020.
//

class Graph<T> where T: Hashable {
    // Properties
    private var vertices = Set<Vertex<T>>()

    // Methods
    func addEdge(item1: T, item2: T?) {
        let vertex1 = (self.vertices.first {
            $0.data == item1
        }) ?? Vertex(data: item1)
        self.vertices.insert(vertex1)
        if let item2 = item2 {
            let vertex2 = (self.vertices.first {
                $0.data == item2
            }) ?? Vertex(data: item2)
            vertex1.neighbors.insert(vertex2)
            vertex2.neighbors.insert(vertex1)
            self.vertices.insert(vertex2)
        }
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
