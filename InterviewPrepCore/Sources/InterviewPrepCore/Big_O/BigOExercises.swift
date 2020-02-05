//
// Created by Zach Miller on 26/01/2020.
//

/// Inspired by "Cracking the Coding Interview" by Gayle Laakmann Mcdowell
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

    func power(base: Int, exponent: Int) -> Int? { // O(exponent)
        print("Exponent: \(exponent)") // O(1)
        if (exponent < 0) { // O(1)
            return nil // O(1)
        } else if (exponent == 0) { // O(1)
            return 1 // O(1)
        } else if let previousResult = self.power(base: base, exponent: (exponent - 1)) { // O(exponent)
            return base * previousResult // O(1)
        } else { // O(1)
            return nil // O(1)
        }
    }

    func modulo(dividend: Int, divisor: Int) -> Int? { // O(1)
        print("-----") // O(1)
        print("\(dividend) modulo \(divisor)...") // O(1)
        guard (divisor > 0) else { // O(1)
            return nil // O(1)
        }
        let quotient = (dividend / divisor) // O(1)
        let remainder = (dividend - (quotient * divisor)) // O(1)
        return remainder // O(1)
    }
}