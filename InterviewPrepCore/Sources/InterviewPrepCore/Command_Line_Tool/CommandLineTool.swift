//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let bigOExamples = BigOExamples()
        bigOExamples.example4(inputA: [1, 2, 3, 4, 5, 6], inputB: [1, 2, 3])
    }
}
