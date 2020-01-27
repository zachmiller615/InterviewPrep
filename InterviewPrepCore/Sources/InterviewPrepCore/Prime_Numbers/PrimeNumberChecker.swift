//
// Created by Zach Miller on 27/01/2020.
//

struct PrimeNumberChecker {
    // Methods
    func isPrime_NaiveSolution(number: Int) -> Bool {
        if (number < 2) {
            return false
        } else if (number == 2) {
            return true
        }
        for smallerNumber in (2..<number) {
            if ((number % smallerNumber) == 0) {
                return false
            }
        }
        return true
    }
}