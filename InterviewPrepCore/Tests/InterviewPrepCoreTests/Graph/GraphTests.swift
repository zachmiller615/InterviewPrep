//
// Created by Zach Miller on 24/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class GraphTests: XCTestCase {
    // Properties
    private var undirectedGraph: Graph<Int>!
    private var directedGraph: Graph<Int>!

    // Methods
    override func setUp() {
        super.setUp()
        self.fillUndirectedGraph()
        self.fillDirectedGraph()
    }

    override func tearDown() {
        self.undirectedGraph = nil
        super.tearDown()
    }

    // Private Methods
    private func fillUndirectedGraph() {
        self.undirectedGraph = Graph(directionType: .undirected)
        self.undirectedGraph.addEdge(from: 1, to: 2)
        self.undirectedGraph.addEdge(from: 1, to: 5)
        self.undirectedGraph.addEdge(from: 2, to: 3)
        self.undirectedGraph.addEdge(from: 2, to: 4)
        self.undirectedGraph.addEdge(from: 2, to: 7)
        self.undirectedGraph.addEdge(from: 3, to: 4)
        self.undirectedGraph.addEdge(from: 3, to: 6)
        self.undirectedGraph.addEdge(from: 3, to: 9)
        self.undirectedGraph.addEdge(from: 4, to: 6)
        self.undirectedGraph.addEdge(from: 8, to: 10)
        self.undirectedGraph.addEdge(from: 11, to: nil)
    }

    private func fillDirectedGraph() {
        self.directedGraph = Graph(directionType: .directed)
        self.directedGraph.addEdge(from: 1, to: 2)
        self.directedGraph.addEdge(from: 2, to: 3)
        self.directedGraph.addEdge(from: 2, to: 7)
        self.directedGraph.addEdge(from: 3, to: 9)
        self.directedGraph.addEdge(from: 4, to: 3)
        self.directedGraph.addEdge(from: 5, to: 7)
        self.directedGraph.addEdge(from: 6, to: 9)
        self.directedGraph.addEdge(from: 7, to: 11)
        self.directedGraph.addEdge(from: 8, to: nil)
        self.directedGraph.addEdge(from: 9, to: 4)
        self.directedGraph.addEdge(from: 10, to: 7)
        self.directedGraph.addEdge(from: 11, to: 10)
    }
}

// Test Cases for Has Path Depth First Search
extension GraphTests {
    func test_HasPathDepthFirstSearch_Undirected_True() {
        // When
        let computedResult = self.undirectedGraph.hasPath_DepthFirstSearch(from: 1, to: 6)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_HasPathDepthFirstSearch_Undirected_False() {
        // When
        let computedResult = self.undirectedGraph.hasPath_DepthFirstSearch(from: 1, to: 10)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_HasPathDepthFirstSearch_Directed_True() {
        // When
        let computedResult = self.directedGraph.hasPath_DepthFirstSearch(from: 1, to: 10)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_HasPathDepthFirstSearch_Directed_False() {
        // When
        let computedResult = self.directedGraph.hasPath_DepthFirstSearch(from: 1, to: 6)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_HasPathDepthFirstSearch_Directed_False_InvalidVertex() {
        // When
        let computedResult = self.directedGraph.hasPath_DepthFirstSearch(from: 1, to: 0)

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Has Path Breadth First Search
extension GraphTests {
    func test_HasPathBreadthFirstSearch_Undirected_True() {
        // When
        let computedResult = self.undirectedGraph.hasPath_BreadthFirstSearch(from: 1, to: 6)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_HasPathBreadthFirstSearch_Undirected_False() {
        // When
        let computedResult = self.undirectedGraph.hasPath_BreadthFirstSearch(from: 1, to: 10)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_HasPathBreadthFirstSearch_Directed_True() {
        // When
        let computedResult = self.directedGraph.hasPath_BreadthFirstSearch(from: 1, to: 10)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_HasPathBreadthFirstSearch_Directed_False() {
        // When
        let computedResult = self.directedGraph.hasPath_BreadthFirstSearch(from: 1, to: 6)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_HasPathBreadthFirstSearch_Directed_False_InvalidVertex() {
        // When
        let computedResult = self.directedGraph.hasPath_BreadthFirstSearch(from: 1, to: 0)

        // Then
        XCTAssertFalse(computedResult)
    }
}