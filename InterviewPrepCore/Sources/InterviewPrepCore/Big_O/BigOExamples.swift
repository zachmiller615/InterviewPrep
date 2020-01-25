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
}