//
// Created by Zach Miller on 17/01/2020.
//

struct FunctionCallStack {
    // Properties
    private var stack: [String] = [] {
        didSet {
            print(self.stack)
        }
    }

    // Methods
    mutating func printCallStack(functionIsRecursive: Bool, input: Int) {
        print("----------")
        self.stack = []
        if (functionIsRecursive) {
            let _ = self.recursiveFunction(input: input)
        } else {
            let _ = self.nonRecursiveFunction(input: input)
        }
        print("----------")
    }
}

// Private Methods
private extension FunctionCallStack {
    mutating func recursiveFunction(input: Int) -> Int {
        let stackItem = "recursiveFunction(\(input))"
        self.stack.append(stackItem)
        if (input <= 0) {
            self.stack.removeLast()
            return 0
        } else {
            let recursiveCallResult = self.recursiveFunction(input: input - 1)
            self.stack.removeLast()
            return input + recursiveCallResult
        }
    }

    mutating func nonRecursiveFunction(input: Int) -> Int {
        let stackItem = "nonRecursiveFunction(\(input))"
        self.stack.append(stackItem)
        var sum = 0
        for number in 0...input {
            sum += number
        }
        self.stack.removeLast()
        return sum
    }
}
