//
// Created by Zach Miller on 20/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class QueueTests: XCTestCase {
    // Properties
    private let emptyQueue = Queue<Int>()
    private var fullQueue: Queue<Int>!

    // Methods
    override func setUp() {
        super.setUp()
        self.fillQueue()
    }

    override func tearDown() {
        self.fullQueue = nil
        super.tearDown()
    }

    // Private Methods
    private func fillQueue() {
        self.fullQueue = Queue()
        self.fullQueue.enqueue(1)
        self.fullQueue.enqueue(2)
        self.fullQueue.enqueue(3)
        self.fullQueue.enqueue(4)
        self.fullQueue.enqueue(5)
    }
}

// Test Cases for Is Empty
extension QueueTests {
    func test_IsEmpty_True() {
        // When
        let computedResult = self.emptyQueue.isEmpty()

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_IsEmpty_False() {
        // When
        let computedResult = self.fullQueue.isEmpty()

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Dequeue
extension QueueTests {
    func test_Dequeue_BasicCase() {
        // When
        let firstDequeue = self.fullQueue.dequeue()
        let secondDequeue = self.fullQueue.dequeue()

        // Then
        XCTAssertEqual(firstDequeue, 1)
        XCTAssertEqual(secondDequeue, 2)
    }

    func test_Dequeue_NilCase() {
        // When
        let computedResult = self.emptyQueue.dequeue()

        // Then
        XCTAssertNil(computedResult)
    }
}

// Test Cases for Peek
extension QueueTests {
    func test_Peek_BasicCase() {
        // When
        let firstPeek = self.fullQueue.peek()
        let secondPeek = self.fullQueue.peek()

        // Then
        XCTAssertEqual(firstPeek, 1)
        XCTAssertEqual(secondPeek, 1)
    }

    func test_Peek_NilCase() {
        // When
        let computedResult = self.emptyQueue.peek()

        // Then
        XCTAssertNil(computedResult)
    }
}