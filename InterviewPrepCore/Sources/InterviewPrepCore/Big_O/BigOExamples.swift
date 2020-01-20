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
}