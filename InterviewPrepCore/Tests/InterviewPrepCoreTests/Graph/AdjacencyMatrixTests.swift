//
// Created by Zach Miller on 06/03/2020.
//

import XCTest
@testable import InterviewPrepCore

class AdjacencyMatrixTests: XCTestCase {
}

// Test Cases for Topological Sort
extension AdjacencyMatrixTests {
    func test_TopologicalSort_BasicCase() {
        // Given
        let adjacencyMatrix = AdjacencyMatrix(edgeDirectionType: .directed, numberOfVertices: 8)
        try! adjacencyMatrix.addEdge(from: 0, to: 4)
        try! adjacencyMatrix.addEdge(from: 1, to: 0)
        try! adjacencyMatrix.addEdge(from: 1, to: 4)
        try! adjacencyMatrix.addEdge(from: 1, to: 7)
        try! adjacencyMatrix.addEdge(from: 2, to: 0)
        try! adjacencyMatrix.addEdge(from: 3, to: 6)
        try! adjacencyMatrix.addEdge(from: 5, to: 0)
        try! adjacencyMatrix.addEdge(from: 5, to: 1)
        try! adjacencyMatrix.addEdge(from: 5, to: 2)

        // When
        let computedResult = adjacencyMatrix.topologicalSort()

        // Then
        XCTAssertEqual(computedResult!.sorted(), [0, 1, 2, 3, 4, 5, 6, 7])
        XCTAssertLessThan(computedResult!.firstIndex(of: 0)!, computedResult!.firstIndex(of: 4)!)
        XCTAssertLessThan(computedResult!.firstIndex(of: 1)!, computedResult!.firstIndex(of: 0)!)
        XCTAssertLessThan(computedResult!.firstIndex(of: 1)!, computedResult!.firstIndex(of: 4)!)
        XCTAssertLessThan(computedResult!.firstIndex(of: 1)!, computedResult!.firstIndex(of: 7)!)
        XCTAssertLessThan(computedResult!.firstIndex(of: 2)!, computedResult!.firstIndex(of: 0)!)
        XCTAssertLessThan(computedResult!.firstIndex(of: 3)!, computedResult!.firstIndex(of: 6)!)
        XCTAssertLessThan(computedResult!.firstIndex(of: 5)!, computedResult!.firstIndex(of: 0)!)
        XCTAssertLessThan(computedResult!.firstIndex(of: 5)!, computedResult!.firstIndex(of: 1)!)
        XCTAssertLessThan(computedResult!.firstIndex(of: 5)!, computedResult!.firstIndex(of: 2)!)
    }

    func test_TopologicalSort_NilCase() {
        // Given
        let adjacencyMatrix = AdjacencyMatrix(edgeDirectionType: .directed, numberOfVertices: 8)
        try! adjacencyMatrix.addEdge(from: 0, to: 4)
        try! adjacencyMatrix.addEdge(from: 1, to: 0)
        try! adjacencyMatrix.addEdge(from: 1, to: 4)
        try! adjacencyMatrix.addEdge(from: 1, to: 7)
        try! adjacencyMatrix.addEdge(from: 2, to: 0)
        try! adjacencyMatrix.addEdge(from: 3, to: 6)
        try! adjacencyMatrix.addEdge(from: 5, to: 0)
        try! adjacencyMatrix.addEdge(from: 5, to: 1)
        try! adjacencyMatrix.addEdge(from: 5, to: 2)
        try! adjacencyMatrix.addEdge(from: 4, to: 2) // Creates a cycle

        // When
        let computedResult = adjacencyMatrix.topologicalSort()

        // Then
        XCTAssertNil(computedResult)
    }
}