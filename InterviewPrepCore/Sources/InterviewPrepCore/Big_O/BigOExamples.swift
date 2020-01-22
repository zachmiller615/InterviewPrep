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
}