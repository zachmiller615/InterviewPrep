//
// Created by Zach Miller on 19/01/2020.
//

struct RecursiveRunTimes {
    // Methods
    func printWorkForExponentialTimeAlgorithm(input: Int) {
        print("----------")
        self.exponentialTimeAlgorithm(number: input)
        print("----------")
    }
}

// Private Methods
private extension RecursiveRunTimes {
    func exponentialTimeAlgorithm(number: Int) -> Int {
        print("recursiveFunction(\(number))")
        if (number <= 1) {
            return 1
        } else {
            return exponentialTimeAlgorithm(number: number - 1) + exponentialTimeAlgorithm(number: number - 1)
        }
    }
}
