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
}