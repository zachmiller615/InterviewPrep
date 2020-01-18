//
// Created by Zach Miller on 18/01/2020.
//

struct MultiPartAlgorithms {
    // Methods
    func printWorkForAddingTheRunTimes(array1: [Int], array2: [Int]) {
        print("----------")
        for number in array1 {
            print(number)
        }
        for number in array2 {
            print(number)
        }
        print("----------")
    }

    func printWorkForMultiplyingTheRunTimes(array1: [Int], array2: [Int]) {
        print("----------")
        for numberFromArray1 in array1 {
            for numberFromArray2 in array2 {
                print("\(numberFromArray1) \(numberFromArray2)")
            }
        }
        print("----------")
    }
}
