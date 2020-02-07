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

    func searchUnbalancedBinarySearchTree() {
        let sortedElements = [1, 2, 3, 4, 5, 7, 8, 9, 10]
        let targetElement = 25
        let binarySearchTree = BinarySearchTree<Int>()
        for element in sortedElements {
            binarySearchTree.insert(element)
        }
        let _ = binarySearchTree.contains(targetElement) // O(sortedElements.count)
    }

    func searchUnorderedBinaryTree() {
        let node1 = BinaryTreeNode(data: 1)
        let node2 = BinaryTreeNode(data: 2)
        let node3 = BinaryTreeNode(data: 3)
        let node4 = BinaryTreeNode(data: 4)
        let node5 = BinaryTreeNode(data: 5)
        node1.leftChild = node4
        node1.rightChild = node2
        node4.leftChild = node5
        node2.leftChild = node3
        let _ = node1.contains(6) // O(numberOfNodes)
    }

    func repeatedlyCopyElements(array: [Int]) -> [Int] { // O(array.count ^ 2)
        var copy: [Int] = [] // O(1)
        for value in array { // O(array.count)
            print("Original Array Iteration - Value: \(value)") // O(1)
            copy = self.copyAndAppendToNew(array: copy, value: value) // O(copy.count)
        }
        return copy // O(1)
    }

    func sumDigits(input: Int) -> Int { // O(log input)
        var number = input // O(1)
        var sum = 0 // O(1)
        while (number > 0) { // O(log input)
            print("Number: \(number)") // O(1)
            sum += (number % 10) // O(1)
            number /= 10 // O(1)
        }
        return sum // O(1)
    }

    // O(alphabetLength ^ stringLength) [all possible strings] * O(stringLength) [check if sorted]
    // O(stringLength * (alphabetLength ^ stringLength))
    func printSortedStrings(stringLength: Int) {
        self.printSortedStrings(remainingStringLength: stringLength, prefix: "")
    }

    func findIntersectingElements(array1: [Int], array2: [Int]) -> Set<Int> { // O((array2 log array2) + (array1 log array2))
        let sorter = Sorter() // O(1)
        let searcher = Searcher() // O(1)
        let sortedArray2 = sorter.mergeSort(array2) // (array2 log array2)
        var intersectingElements = Set<Int>() // O(1)
        for value in array1 { // O(array1)
            if let index = searcher.binarySearchIterative(sortedArray: sortedArray2, target: value) { // O(log sortedArray2)
                intersectingElements.insert(sortedArray2[index]) // O(1)
            }
        }
        return intersectingElements // O(1)
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

    func copyAndAppendToNew(array: [Int], value: Int) -> [Int] { // O(array.count)
        var copy: [Int] = [] // O(1)
        for number in array { // O(array.count)
            print("Copy: \(number)") // O(1)
            copy.append(number) // O(1) [amortized]
        }
        print("Append: \(value)") // O(1)
        copy.append(value) // O(1) [amortized]
        return copy // O(1)
    }

    func printSortedStrings(remainingStringLength: Int, prefix: String) {
        if (remainingStringLength == 0) {
            if let isInOrder = self.isInOrder(text: prefix), isInOrder {
                print("Sorted String: \(prefix)")
            }
        } else {
            let asciiFirst = 97
            let asciiLast = 122
            for index in (asciiFirst...asciiLast) {
                if let asciiValue = UnicodeScalar(index) {
                    let character = Character(asciiValue)
                    self.printSortedStrings(remainingStringLength: (remainingStringLength - 1), prefix: (prefix + String(character)))
                }
            }
        }
    }

    func isInOrder(text: String) -> Bool? { // O(text.count)
        guard !text.isEmpty else { // O(1)
            return nil // O(1)
        }
        for index in (1..<text.count) { // O(text.count)
            let stringIndex = String.Index(utf16Offset: index, in: text) // O(1)
            let currentCharacter = text[stringIndex] // O(1)
            let previousCharacter = text[text.index(before: stringIndex)] // O(1)
            if (previousCharacter > currentCharacter) { // O(1)
                return false // O(1)
            }
        }
        return true // O(1)
    }
}