//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let bigOExercises = BigOExercises()
        let result = bigOExercises.modulo(dividend: 16, divisor: 7)
        print(result)
        print("-----")
    }
}