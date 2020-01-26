//
// Created by Zach Miller on 26/01/2020.
//

struct BigOExercises {
    // Methods
    func product(firstOperand: Int, secondOperand: Int) -> Int { // O(secondOperand)
        var sum = 0 // O(1)
        for index in 0..<secondOperand { // O(secondOperand)
            print("Iteration: \(index)") // O(1)
            sum += firstOperand // O(1)
        }
        return sum // O(1)
    }
}