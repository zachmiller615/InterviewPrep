//
// Created by Zach Miller on 28/01/2020.
//

struct DynamicProgramming {
    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// A child is running up a staircase with n steps and can hop either 1 step, 2 steps, or 3 steps at a time.
    /// Implement a method to count how many possible ways the child can run up the stairs.
    func tripleStep(numberOfSteps: Int) -> Int? {
        var nMinus3 = 1
        var nMinus2 = 2
        var nMinus1 = 4

        if (numberOfSteps < 1) {
            return nil
        } else if (numberOfSteps == 1) {
            return nMinus3
        } else if (numberOfSteps == 2) {
            return nMinus2
        } else if (numberOfSteps == 3) {
            return nMinus1
        }

        var index = 4
        while (index < numberOfSteps) {
            let intermediateResult = (nMinus3 + nMinus2 + nMinus1)
            nMinus3 = nMinus2
            nMinus2 = nMinus1
            nMinus1 = intermediateResult
            index += 1
        }
        return (nMinus3 + nMinus2 + nMinus1)
    }
}