//
// Created by Zach Miller on 20/01/2020.
//

struct BigOExamples {
    // Methods
    func example1(input: [Int]) {
        print("-----")
        var sum = 0
        var product = 1
        for number in input {
            print("First loop: \(number)")
            sum += number
        }
        for number in input {
            print("Second loop: \(number)")
            product *= number
        }
        print("Sum: \(sum), Product: \(product)")
        print("-----")
    }

    func example2(input: [Int]) {
        print("-----")
        for number1 in input {
            for number2 in input {
                print("\(number1), \(number2)")
            }
        }
        print("-----")
    }

    func example3(input: [Int]) {
        print("-----")
        for index1 in 0..<input.count {
            for index2 in ((index1 + 1)..<input.count) {
                print("\(input[index1]), \(input[index2])")
            }
        }
        print("-----")
    }

    func example4(inputA: [Int], inputB: [Int]) {
        print("-----")
        for indexA in 0..<inputA.count {
            for indexB in 0..<inputB.count {
                print("If Check")
                if (inputA[indexA] < inputB[indexB]) {
                    print("\(inputA[indexA]), \(inputB[indexB])")
                }
            }
        }
        print("-----")
    }

    func example5(inputA: [Int], inputB: [Int]) {
        print("-----")
        for numberA in inputA {
            for numberB in inputB {
                for _ in 0..<100000 {
                    print("\(numberA), \(numberB)")
                }
            }
        }
        print("-----")
    }

    func example6(input: [Int]) {
        print("-----")
        var array = input
        for index in (0..<(array.count / 2)) {
            print("Index \(index)")
            let other = array.count - index - 1
            let temp = array[index]
            array[index] = array[other]
            array[other] = temp
        }
        print("-----")
    }

    func example7(input: [Int]) {
        guard !input.isEmpty else {
            return
        }
        print("-----")
        let array = input[0..<(input.count / 2)]
        for number in input {
            print(number)
        }
        for number in array {
            print(number)
        }
        print("-----")
    }

    func example8(input: inout [String]) {
        print("-----")
        for index in 0..<input.count {
            print("Iteration through input - Index \(index)")
            print("Sorting \(input[index])")
            let sortedCharacters = input[index].sorted()
            let sortedString = sortedCharacters.reduce(into: "") {
                $0.append($1)
            }
            input[index] = sortedString
        }
        print("Sorting \(input)")
        input.sort()
        print("-----")
    }

    func example9(input: BinaryTreeNode<Int>?) -> Int {
        print(input?.data as Any)
        if let node = input {
            return self.example9(input: node.leftChild) + node.data + self.example9(input: node.rightChild)
        } else {
            return 0
        }
    }

    func example10(input: Int) -> Bool {
        print("-----")
        var number = 2
        while (number * number <= input) {
            print(number)
            if (input % number == 0) {
                print("-----")
                return false
            }
            number += 1
        }
        print("-----")
        return true
    }

    func example11(input: Int) -> Int {
        print(input)
        if (input < 0) {
            return -1
        } else if (input == 0) {
            return 1
        } else {
            return input * self.example11(input: input - 1)
        }
    }

    func example12(input: String) {
        self.example12Helper(text: input, prefix: "")
        print("-----")
    }

    func example13(input: Int) -> Int {
        print(input)
        if (input <= 0) {
            return 0
        } else if (input == 1) {
            return 1
        } else {
            return self.example13(input: input - 1) + self.example13(input: input - 2)
        }
    }

    func example14(input: Int) {
        print("-----")
        for index in 0...input {
            let result = self.example13(input: index)
            print("Fib(\(index)): \(result)")
        }
        print("-----")
    }

    func example15(input: Int) {
        var cache = Array(repeating: 0, count: input + 1)
        for index in 0...input {
            print("-----")
            let result = self.example15Helper(number: index, cache: &cache)
            print("Fib(\(index)): \(result)")
        }
        print("-----")
    }

    func example16(input: Int) -> Int {
        if (input < 1) {
            return 0
        } else if (input == 1) {
            print(1)
            return 1
        } else {
            let previous = self.example16(input: input / 2)
            let current = previous * 2
            print(current)
            return current
        }
    }
}

// Private Methods
private extension BigOExamples {
    func example12Helper(text: String, prefix: String) {
        print("-----")
        print("Current Text: \(text)")
        print("Current Prefix: \(prefix)")
        if text.isEmpty {
            print("Base Case")
        } else {
            for index in 0..<text.count {
                print("-----")
                print("Text Index: \(index)")
                let prefixEnd = String.Index(utf16Offset: index, in: text)
                let suffixStart = text.index(after: prefixEnd)
                let part1 = text[..<prefixEnd]
                let part2 = text[prefixEnd]
                let part3 = text[suffixStart..<text.endIndex]
                let newText = String(part1 + part3)
                let newPrefix = prefix + String(part2)
                print("Part 1: \(part1)")
                print("Part 2: \(part2)")
                print("Part 3: \(part3)")
                print("New Text: \(newText)")
                print("New Prefix: \(newPrefix)")
                self.example12Helper(text: newText, prefix: newPrefix)
            }
        }
    }

    func example15Helper(number: Int, cache: inout [Int]) -> Int {
        print("Recursive Call: \(number)")
        if (number <= 0) {
            return 0
        } else if (number == 1) {
            return 1
        } else if (cache[number] > 0) {
            return cache[number]
        } else {
            cache[number] =
                    self.example15Helper(number: number - 1, cache: &cache) +
                            self.example15Helper(number: number - 2, cache: &cache)
            return cache[number]
        }
    }
}