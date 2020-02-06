//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let bigOExercises = BigOExercises()
        let result = bigOExercises.integerSquareRoot(number: 100)
        print(result as Any)
        print("-----")
    }
}