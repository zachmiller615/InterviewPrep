//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let bigOExercises = BigOExercises()
        let result = bigOExercises.integerDivision(dividend: 40, divisor: 5)
        print(result as Any)
        print("-----")
    }
}