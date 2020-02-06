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

    func integerDivision(dividend: Int, divisor: Int) -> Int? { // O(dividend / divisor)
        guard ((dividend >= 0) && (divisor > 0)) else { // O(1)
            return nil // O(1)
        }
        var count = 0 // O(1)
        var sum = divisor // O(1)
        while (sum <= dividend) { // O(dividend / divisor)
            print("Iteration - Sum: \(sum)") // O(1)
            sum += divisor // O(1)
            count += 1 // O(1)
        }
        return count // O(1)
    }

    func integerSquareRoot(number: Int) -> Int? { // O(log number)
        print("-----") // O(1)
        return self.integerSquareRoot(number: number, min: 1, max: number) // O(log number)
    }

    func integerSquareRoot2(number: Int) -> Int? { // O(squareRoot(number))
        print("-----") // O(1)
        var guess = 1 // O(1)
        while (guess * guess <= number) { // O(squareRoot(number))
            print("Guess: \(guess)") // O(1)
            if (guess * guess == number) { // O(1)
                return guess // O(1)
            }
            guess += 1 // O(1)
        }
        return nil // O(1)
    }
}

// Private Methods
private extension BigOExercises {
    func integerSquareRoot(number: Int, min: Int, max: Int) -> Int? { // O(log number)
        print("Min: \(min), Max: \(max)") // O(1)
        guard (max >= min) else { // O(1)
            return nil // O(1)
        }
        let guess = ((min + max) / 2) // O(1)
        if ((guess * guess) == number) { // O(1)
            return guess // O(1)
        } else if ((guess * guess) < number) { // O(1)
            return self.integerSquareRoot(number: number, min: (guess + 1), max: max) // O(log number)
        } else { // O(1)
            return self.integerSquareRoot(number: number, min: min, max: (guess - 1)) // O(log number)
        }
    }
}