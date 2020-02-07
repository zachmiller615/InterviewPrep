//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let bigOExercises = BigOExercises()
        print("-----")
        let result = bigOExercises.sumDigits(input: 35250)
        print("Result: \(result)")
        print("-----")
    }
}