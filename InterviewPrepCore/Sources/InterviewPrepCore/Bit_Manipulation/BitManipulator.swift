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

    func insert(smallerBitVector: Int, intoLargerBitVector largerBitVector: Int, fromLeastIndex leastIndex: Int, toMostIndex mostIndex: Int) -> Int? {
        guard (leastIndex <= mostIndex) &&
                      (0 <= leastIndex) &&
                      (leastIndex <= smallerBitVector.bitWidth) &&
                      (0 <= mostIndex) &&
                      (mostIndex <= smallerBitVector.bitWidth) else {
            return nil
        }
        let rangeEnd = (mostIndex - leastIndex)
        var resultBitVector = largerBitVector
        for indexForSmallerBitVector in 0...rangeEnd {
            let indexForResultBitVector = leastIndex + indexForSmallerBitVector
            let newBitValue = self.getBitValue(atIndex: indexForSmallerBitVector, inBitVector: smallerBitVector)
            resultBitVector = self.updateBitValue(atIndex: indexForResultBitVector, inBitVector: resultBitVector, bitIs1: newBitValue)
        }
        return resultBitVector
    }
}