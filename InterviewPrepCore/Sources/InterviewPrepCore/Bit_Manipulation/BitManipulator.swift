//
// Created by Zach Miller on 25/01/2020.
//

struct BitManipulator {
    // Methods
    func getBitValue(atIndex index: Int, inBitVector originalBitVector: Int) -> Bool {
        let bitMask = (1 << index)
        let resultBitVector = (bitMask & originalBitVector)
        return (resultBitVector != 0)
    }
}