//
// Created by Zach Miller on 25/01/2020.
//

struct BitManipulator {
    // Methods
    func getBitValue(atIndex index: Int, inBitVector originalBitVector: Int) -> Bool {
        let bitMask = (1 << index)
        let resultBitVector = (originalBitVector & bitMask)
        return (resultBitVector != 0)
    }

    func setBitValue(atIndex index: Int, inBitVector bitVector: Int) -> Int {
        let bitMask = (1 << index)
        return (bitVector | bitMask)
    }

    func clearBitValue(atIndex index: Int, inBitVector bitVector: Int) -> Int {
        let bitMask = ~(1 << index)
        return (bitVector & bitMask)
    }

    func clearBitsStartingFromMSB(throughIndex index: Int, inBitVector bitVector: Int) -> Int {
        let bitMask = ((1 << index) - 1)
        return (bitVector & bitMask)
    }

    func clearBitsStartingFromLSB(throughIndex index: Int, inBitVector bitVector: Int) -> Int {
        let bitMask = (-1 << (index + 1))
        return (bitVector & bitMask)
    }

    func updateBitValue(atIndex index: Int, inBitVector originalBitVector: Int, bitIs1: Bool) -> Int {
        let bitVectorClearedAtIndex = self.clearBitValue(atIndex: index, inBitVector: originalBitVector)
        let newBitValue = bitIs1 ? 1 : 0
        let bitMask = (newBitValue << index)
        return (bitVectorClearedAtIndex | bitMask)
    }

    func insert(smallerBitVector: Int, intoLargerBitVector largerBitVector: Int, fromLeastIndex leastIndex: Int, toMostIndex mostIndex: Int) -> Int {
        let leftSideOfMask = (-1 << (mostIndex + 1))
        let rightSideOfMask = ((1 << leastIndex) - 1)
        let mask = (leftSideOfMask | rightSideOfMask)
        let largerBitVectorWithRangeCleared = (largerBitVector & mask)
        let smallerBitVectorShiftedIntoPosition = (smallerBitVector << leastIndex)
        return (largerBitVectorWithRangeCleared | smallerBitVectorShiftedIntoPosition)
    }
}