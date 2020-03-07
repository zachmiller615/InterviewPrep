//
// Created by Zach Miller on 07/03/2020.
//

import XCTest
@testable import InterviewPrepCore

class WeightedAdjacencyMatrixTests: XCTestCase {
}

// Test Cases for Find Minimum Path
extension WeightedAdjacencyMatrixTests {
    func test_FindMinimumPath_BasicCase() {
        // Given
        let adjacencyMatrix = WeightedAdjacencyMatrix(edgeDirectionType: .directed, numberOfVertices: 9)
        do {
            try adjacencyMatrix.addEdge(source: 0, target: 1, weight: 5)
            try adjacencyMatrix.addEdge(source: 0, target: 2, weight: 3)
            try adjacencyMatrix.addEdge(source: 0, target: 4, weight: 2)
            try adjacencyMatrix.addEdge(source: 1, target: 3, weight: 2)
            try adjacencyMatrix.addEdge(source: 2, target: 1, weight: 1)
            try adjacencyMatrix.addEdge(source: 2, target: 3, weight: 1)
            try adjacencyMatrix.addEdge(source: 3, target: 0, weight: 1)
            try adjacencyMatrix.addEdge(source: 3, target: 6, weight: 2)
            try adjacencyMatrix.addEdge(source: 3, target: 7, weight: 1)
            try adjacencyMatrix.addEdge(source: 4, target: 7, weight: 4)
            try adjacencyMatrix.addEdge(source: 4, target: 8, weight: 7)
            try adjacencyMatrix.addEdge(source: 4, target: 0, weight: 1)
            try adjacencyMatrix.addEdge(source: 5, target: 1, weight: 3)
            try adjacencyMatrix.addEdge(source: 5, target: 6, weight: 1)
            try adjacencyMatrix.addEdge(source: 6, target: 2, weight: 3)
            try adjacencyMatrix.addEdge(source: 6, target: 8, weight: 2)
            try adjacencyMatrix.addEdge(source: 7, target: 2, weight: 2)
            try adjacencyMatrix.addEdge(source: 7, target: 5, weight: 2)
            try adjacencyMatrix.addEdge(source: 7, target: 6, weight: 2)
        } catch let AdjacencyMatrixError.invalidVertex(message) {
            print("Error: \(message)")
        } catch {
            print("Unexpected error: \(error)")
        }

        let expectedResult = (path: [0, 2, 3, 6, 8], distance: 8.0)

        // When
        let computedResult = adjacencyMatrix.findMinimumPath(from: 0, to: 8)

        // Then
        XCTAssertEqual(computedResult!.path, expectedResult.path)
        XCTAssertEqual(computedResult!.distance, expectedResult.distance)
    }

    func test_FindMinimumPath_NilCase() {
        // Given
        let adjacencyMatrix = WeightedAdjacencyMatrix(edgeDirectionType: .directed, numberOfVertices: 9)
        do {
            try adjacencyMatrix.addEdge(source: 0, target: 1, weight: 5)
            try adjacencyMatrix.addEdge(source: 0, target: 2, weight: 3)
            try adjacencyMatrix.addEdge(source: 0, target: 4, weight: 2)
            try adjacencyMatrix.addEdge(source: 1, target: 3, weight: 2)
            try adjacencyMatrix.addEdge(source: 2, target: 1, weight: 1)
            try adjacencyMatrix.addEdge(source: 2, target: 3, weight: 1)
            try adjacencyMatrix.addEdge(source: 3, target: 0, weight: 1)
            try adjacencyMatrix.addEdge(source: 3, target: 6, weight: 2)
            try adjacencyMatrix.addEdge(source: 3, target: 7, weight: 1)
            try adjacencyMatrix.addEdge(source: 4, target: 7, weight: 4)
            try adjacencyMatrix.addEdge(source: 4, target: 0, weight: 1)
            try adjacencyMatrix.addEdge(source: 5, target: 1, weight: 3)
            try adjacencyMatrix.addEdge(source: 5, target: 6, weight: 1)
            try adjacencyMatrix.addEdge(source: 6, target: 2, weight: 3)
            try adjacencyMatrix.addEdge(source: 7, target: 2, weight: 2)
            try adjacencyMatrix.addEdge(source: 7, target: 5, weight: 2)
            try adjacencyMatrix.addEdge(source: 7, target: 6, weight: 2)
        } catch let AdjacencyMatrixError.invalidVertex(message) {
            print("Error: \(message)")
        } catch {
            print("Unexpected error: \(error)")
        }

        // When
        let computedResult = adjacencyMatrix.findMinimumPath(from: 0, to: 8)

        // Then
        XCTAssertNil(computedResult)
    }
}