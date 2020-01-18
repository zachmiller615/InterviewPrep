//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let multiPartAlgorithms = MultiPartAlgorithms()
        let array1 = [1, 2, 3, 4, 5]
        let array2 = [6, 7, 8, 9, 10]
        multiPartAlgorithms.printWorkForAddingTheRunTimes(array1: array1, array2: array2)
        multiPartAlgorithms.printWorkForMultiplyingTheRunTimes(array1: array1, array2: array2)
    }
}
