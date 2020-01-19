//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let graph = Graph<Int>()
        graph.addEdge(item1: 1, item2: 2)
        graph.addEdge(item1: 1, item2: 3)
        graph.addEdge(item1: 4, item2: 5)
        graph.addEdge(item1: 2, item2: 5)
        graph.addEdge(item1: 6, item2: nil)
        print(graph)
    }
}
