//
// Created by Zach Miller on 22/02/2020.
//

struct Recursion {
    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// Write a recursive function to multiply two positive integers without using the * operator.
    /// You can use addition, subtraction, and bit shifting, but you should minimize the number of those operations.
    func multiply(positiveOperand1 operand1: Int, positiveOperand2 operand2: Int) -> Int? {
        guard ((operand1 >= 0) && (operand2 >= 0)) else {
            return nil
        }
        if (operand2 == 0) {
            return 0
        }
        let recursiveResult = self.multiply(positiveOperand1: operand1, positiveOperand2: (operand2 - 1))!
        return operand1 + recursiveResult
    }
}