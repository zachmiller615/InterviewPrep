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
        let result = bigOExercises.repeatedlyCopyElements(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        print("Result: \(result)")
        print("-----")
    }
}