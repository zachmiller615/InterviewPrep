//
// Created by Zach Miller on 19/01/2020.
//

class Vertex<T> where T: Hashable {
    // Properties
    let data: T
    var neighbors = Set<T>()

    // Initializer
    init(data: T) {
        self.data = data
    }
}

// Hashable
extension Vertex: Hashable {
    static func ==(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        lhs.data == rhs.data
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.data)
    }
}