//
// Created by Zach Miller on 24/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class GraphTests: XCTestCase {
    // Properties
    private var graph: Graph<Int>!

    // Methods
    override func setUp() {
        super.setUp()
        self.fillGraph()
    }

    override func tearDown() {
        self.graph = nil
        super.tearDown()
    }

    // Private Methods
    private func fillGraph() {
        self.graph = Graph()
        self.graph.addEdge(item1: 1, item2: 2)
        self.graph.addEdge(item1: 1, item2: 5)
        self.graph.addEdge(item1: 2, item2: 3)
        self.graph.addEdge(item1: 2, item2: 4)
        self.graph.addEdge(item1: 2, item2: 7)
        self.graph.addEdge(item1: 3, item2: 4)
        self.graph.addEdge(item1: 3, item2: 6)
        self.graph.addEdge(item1: 3, item2: 9)
        self.graph.addEdge(item1: 4, item2: 6)
        self.graph.addEdge(item1: 8, item2: 10)
        self.graph.addEdge(item1: 11, item2: nil)
    }
}

// Test Cases for Has Path Depth First Search
extension GraphTests {
    func test_HasPathDepthFirstSearch_True() {
        // When
        let computedResult = self.graph.hasPath_DepthFirstSearch(source: 1, target: 6)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_HasPathDepthFirstSearch_False() {
        // When
        let computedResult = self.graph.hasPath_DepthFirstSearch(source: 1, target: 10)

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Has Path Breadth First Search
extension GraphTests {
    func test_HasPathBreadthFirstSearch_True() {
        // When
        let computedResult = self.graph.hasPath_BreadthFirstSearch(source: 1, target: 6)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_HasPathBreadthFirstSearch_False() {
        // When
        let computedResult = self.graph.hasPath_BreadthFirstSearch(source: 1, target: 10)

        // Then
        XCTAssertFalse(computedResult)
    }
}