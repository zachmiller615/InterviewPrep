//
// Created by Zach Miller on 12/02/2020.
//

import XCTest
@testable import InterviewPrepCore

class ProjectDependencyGraphTests: XCTestCase {
}

// Test Cases for Create Build Order
extension ProjectDependencyGraphTests {
    func test_CreateBuildOrder_BasicCase() {
        // Given
        let projectDependencyGraph = ProjectDependencyGraph<String>()
        let projects = ["A", "B", "C", "D", "E", "F"]
        let dependencyPairs = [("A", "D"), ("F", "B"), ("B", "D"), ("F", "A"), ("D", "C")]

        // When
        let optionalComputedResult = projectDependencyGraph.createBuildOrder(projects: projects, dependencyPairs: dependencyPairs)

        // Then
        XCTAssertNotNil(optionalComputedResult)
        if let computedResult = optionalComputedResult {
            XCTAssertLessThan(computedResult.firstIndex(of: "A")!, computedResult.firstIndex(of: "D")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "F")!, computedResult.firstIndex(of: "B")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "B")!, computedResult.firstIndex(of: "D")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "F")!, computedResult.firstIndex(of: "A")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "D")!, computedResult.firstIndex(of: "C")!)
            XCTAssertTrue(computedResult.contains("E"))
        }
    }

    func test_CreateBuildOrder_ComplexCase() {
        // Given
        let projectDependencyGraph = ProjectDependencyGraph<String>()
        let projects = ["A", "B", "C", "D", "E", "F", "G"]
        let dependencyPairs = [("G", "D"), ("E", "A"), ("E", "B"), ("A", "B"), ("A", "C"), ("A", "F"), ("C", "F"), ("B", "F")]

        // When
        let optionalComputedResult = projectDependencyGraph.createBuildOrder(projects: projects, dependencyPairs: dependencyPairs)

        // Then
        XCTAssertNotNil(optionalComputedResult)
        if let computedResult = optionalComputedResult {
            XCTAssertLessThan(computedResult.firstIndex(of: "G")!, computedResult.firstIndex(of: "D")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "E")!, computedResult.firstIndex(of: "A")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "E")!, computedResult.firstIndex(of: "B")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "A")!, computedResult.firstIndex(of: "B")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "A")!, computedResult.firstIndex(of: "C")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "A")!, computedResult.firstIndex(of: "F")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "C")!, computedResult.firstIndex(of: "F")!)
            XCTAssertLessThan(computedResult.firstIndex(of: "B")!, computedResult.firstIndex(of: "F")!)
        }
    }

    func test_CreateBuildOrder_NilCase() {
        // Given
        let projectDependencyGraph = ProjectDependencyGraph<String>()
        let projects = ["A", "B", "C"]
        let dependencyPairs = [("A", "B"), ("B", "C"), ("C", "A")]

        // When
        let computedResult = projectDependencyGraph.createBuildOrder(projects: projects, dependencyPairs: dependencyPairs)

        // Then
        XCTAssertNil(computedResult)
    }
}