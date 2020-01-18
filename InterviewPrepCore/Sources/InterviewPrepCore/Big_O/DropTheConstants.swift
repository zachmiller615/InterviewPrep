//
// Created by Zach Miller on 18/01/2020.
//

struct DropTheConstants {
    // Methods
    func printWorkForOneForLoop() {
        var min = Int.max
        var max = Int.min
        let array = [1, 4, 6, 4, 8, 2, 10, 3]
        print("----------")
        for number in array {
            print("Checking min...")
            if (number < min) { min = number }
            print("Checking max...")
            if (number > max) { max = number }
        }
        print("----------")
    }

    func printWorkForTwoForLoops() {
        var min = Int.max
        var max = Int.min
        let array = [1, 4, 6, 4, 8, 2, 10, 3]
        print("----------")
        for number in array {
            print("Checking min...")
            if (number < min) { min = number }
        }
        for number in array {
            print("Checking max...")
            if (number > max) { max = number }
        }
        print("----------")
    }
}
