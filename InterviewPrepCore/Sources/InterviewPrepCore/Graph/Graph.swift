//
// Created by Zach Miller on 19/01/2020.
//

private class GraphVertex<T> {
    // Properties
    let data: T
    var neighbors: [GraphVertex<T>] = []

    // Initializer
    init(data: T) {
        self.data = data
    }
}

class Graph<T> {
    // Properties
    private var nodes: [GraphVertex<T>] = []

    // Methods
    func addEdge(from sourceVertex: T, to destinationVertex: T?) {

    }
}
















































