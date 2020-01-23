//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let bigOExamples = BigOExamples()
        var input: [String] = ["hello", "goodbye", "shalom", "world", "game"]
        bigOExamples.example8(input: &input)
    }
}