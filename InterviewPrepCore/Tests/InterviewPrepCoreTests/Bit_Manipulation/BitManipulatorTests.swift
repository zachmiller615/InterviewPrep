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
        let bitVector = 0b1010101
        let index = 4

        // When
        let computedResult = bitManipulator.getBitValue(atIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_GetBitValue_False() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 0b1010101
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
        let bitVector = 0b1010101
        let index = 5
        let expectedResult = 0b1110101

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
        let bitVector = 0b1010101
        let index = 6
        let expectedResult = 0b10101

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
        let bitVector = 0b1010101
        let index = 4
        let expectedResult = 0b101

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
        let bitVector = 0b1010101
        let index = 3
        let expectedResult = 0b1010000

        // When
        let computedResult = bitManipulator.clearBitsStartingFromLSB(throughIndex: index, inBitVector: bitVector)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Update Bit Value
extension BitManipulatorTests {
    func test_UpdateBitValue_SetTo1_LargerVector() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 0b1010101
        let index = 5
        let expectedResult = 0b1110101

        // When
        let computedResult = bitManipulator.updateBitValue(atIndex: index, inBitVector: bitVector, bitIs1: true)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_UpdateBitValue_SetTo1_SmallerVector() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 0b101
        let index = 1
        let expectedResult = 0b111

        // When
        let computedResult = bitManipulator.updateBitValue(atIndex: index, inBitVector: bitVector, bitIs1: true)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_UpdateBitValue_SetTo0_LargerVector() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 0b1010101
        let index = 6
        let expectedResult = 0b10101

        // When
        let computedResult = bitManipulator.updateBitValue(atIndex: index, inBitVector: bitVector, bitIs1: false)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_UpdateBitValue_SetTo0_SmallerVector() {
        // Given
        let bitManipulator = BitManipulator()
        let bitVector = 0b101
        let index = 2
        let expectedResult = 0b1

        // When
        let computedResult = bitManipulator.updateBitValue(atIndex: index, inBitVector: bitVector, bitIs1: false)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }
}

// Test Cases for Insert
extension BitManipulatorTests {
    func test_Insert_BasicCase() {
        // Given
        let bitManipulator = BitManipulator()
        let smallerBitVector = 0b10011
        let largerBitVector = 0b10000000000
        let leastIndex = 2
        let mostIndex = 6
        let expectedResult = 0b10001001100

        // When
        let computedResult = bitManipulator.insert(
                smallerBitVector: smallerBitVector,
                intoLargerBitVector: largerBitVector,
                fromLeastIndex: leastIndex,
                toMostIndex: mostIndex)

        // Then
        XCTAssertEqual(computedResult, expectedResult)
    }

    func test_Insert_InvalidRange() {
        // Given
        let bitManipulator = BitManipulator()
        let smallerBitVector = 0b10011
        let largerBitVector = 0b10000000000
        let leastIndex = 7
        let mostIndex = 6

        // When
        let computedResult = bitManipulator.insert(
                smallerBitVector: smallerBitVector,
                intoLargerBitVector: largerBitVector,
                fromLeastIndex: leastIndex,
                toMostIndex: mostIndex)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_Insert_LeastIndexTooSmall() {
        // Given
        let bitManipulator = BitManipulator()
        let smallerBitVector = 0b10011
        let largerBitVector = 0b10000000000
        let leastIndex = -1
        let mostIndex = 6

        // When
        let computedResult = bitManipulator.insert(
                smallerBitVector: smallerBitVector,
                intoLargerBitVector: largerBitVector,
                fromLeastIndex: leastIndex,
                toMostIndex: mostIndex)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_Insert_MostIndexTooSmall() {
        // Given
        let bitManipulator = BitManipulator()
        let smallerBitVector = 0b10011
        let largerBitVector = 0b10000000000
        let leastIndex = 2
        let mostIndex = -1

        // When
        let computedResult = bitManipulator.insert(
                smallerBitVector: smallerBitVector,
                intoLargerBitVector: largerBitVector,
                fromLeastIndex: leastIndex,
                toMostIndex: mostIndex)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_Insert_LeastIndexTooBig() {
        // Given
        let bitManipulator = BitManipulator()
        let smallerBitVector = 0b10011
        let largerBitVector = 0b10000000000
        let leastIndex = 65
        let mostIndex = 6

        // When
        let computedResult = bitManipulator.insert(
                smallerBitVector: smallerBitVector,
                intoLargerBitVector: largerBitVector,
                fromLeastIndex: leastIndex,
                toMostIndex: mostIndex)

        // Then
        XCTAssertNil(computedResult)
    }

    func test_Insert_MostIndexTooBig() {
        // Given
        let bitManipulator = BitManipulator()
        let smallerBitVector = 0b10011
        let largerBitVector = 0b10000000000
        let leastIndex = 2
        let mostIndex = 65

        // When
        let computedResult = bitManipulator.insert(
                smallerBitVector: smallerBitVector,
                intoLargerBitVector: largerBitVector,
                fromLeastIndex: leastIndex,
                toMostIndex: mostIndex)

        // Then
        XCTAssertNil(computedResult)
    }
}