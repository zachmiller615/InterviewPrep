//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let bigOExamples = BigOExamples()
        bigOExamples.example5(inputA: [1, 2, 3], inputB: [1, 2, 3])
    }
}
