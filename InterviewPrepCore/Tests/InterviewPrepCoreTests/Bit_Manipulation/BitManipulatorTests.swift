//
// Created by Zach Miller on 25/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class BitManipulatorTests: XCTestCase {
}

// Test Cases for Get Bit Value
extension BitManipulatorTests {
    func test_GetBitValue_True() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 4

        // When
        let computedResult = bitManipulator.getBitValue(atIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_GetBitValue_False() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 5

        // When
        let computedResult = bitManipulator.getBitValue(atIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Set Bit Value
extension BitManipulatorTests {
    func test_SetBitValue() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 5
        let expectedResult = 117

        // When
        let computedResult = bitManipulator.setBitValue(atIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Clear Bit Value
extension BitManipulatorTests {
    func test_ClearBitValue() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 6
        let expectedResult = 21

        // When
        let computedResult = bitManipulator.clearBitValue(atIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Clear Bits Starting From MSB
extension BitManipulatorTests {
    func test_ClearBitsStartingFromMSB() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 4
        let expectedResult = 5

        // When
        let computedResult = bitManipulator.clearBitsStartingFromMSB(throughIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Clear Bits Starting From LSB
extension BitManipulatorTests {
    func test_ClearBitsStartingFromLSB() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 3
        let expectedResult = 80

        // When
        let computedResult = bitManipulator.clearBitsStartingFromLSB(throughIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Update Bit Value
extension BitManipulatorTests {
    func test_UpdateBitValue_SetTo1_Case1() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 5
        let expectedResult = 117

        // When
        let computedResult = bitManipulator.updateBitValue(atIndex: index, inBitVector: bitVector, bitIs1: true)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_UpdateBitValue_SetTo1_Case2() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 5
        let index = 1
        let expectedResult = 7

        // When
        let computedResult = bitManipulator.updateBitValue(atIndex: index, inBitVector: bitVector, bitIs1: true)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_UpdateBitValue_SetTo0_Case1() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 85
        let index = 6
        let expectedResult = 21

        // When
        let computedResult = bitManipulator.updateBitValue(atIndex: index, inBitVector: bitVector, bitIs1: false)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_UpdateBitValue_SetTo0_Case2() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 5
        let index = 2
        let expectedResult = 1

        // When
        let computedResult = bitManipulator.updateBitValue(atIndex: index, inBitVector: bitVector, bitIs1: false)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}