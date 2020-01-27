//
// Created by Zach Miller on 27/01/2020.
//

struct PrimeNumberChecker {
    // Methods
    func numberIsPrime(_ number: Int) -> Bool {
        if (number < 2) {
            return false
        } else if (number == 2) {
            return true
        }
        let numberSquareRoot = Int(Double(number).squareRoot())
        for smallerNumber in (2..<numberSquareRoot) {
            if ((number % smallerNumber) == 0) {
                return false
            }
        }
        return true
    }

    func sieveOfEratosthenes(max: Int) -> [Bool] {
        var isPrimeFlags = Array(repeating: true, count: (max + 1))
        isPrimeFlags[0] = false
        isPrimeFlags[1] = false
        var currentPrimeNumber = 2
        while (Double(currentPrimeNumber) <= Double(max).squareRoot()) {
            self.crossOffMultiples(ofPrimeNumber: currentPrimeNumber, in: &isPrimeFlags)
            currentPrimeNumber = self.getNextPrimeNumber(afterCurrentPrimeNumber: currentPrimeNumber, using: isPrimeFlags)
        }
        return isPrimeFlags
    }
}

// Private Methods
private extension PrimeNumberChecker {
    func crossOffMultiples(ofPrimeNumber primeNumber: Int, in flags: inout [Bool]) {
        var currentMultiple = (primeNumber * primeNumber)
        while (currentMultiple < flags.count) {
            flags[currentMultiple] = false
            currentMultiple += primeNumber
        }
    }

    func getNextPrimeNumber(afterCurrentPrimeNumber currentPrimeNumber: Int, using flags: [Bool]) -> Int {
        var possiblePrimeNumber = (currentPrimeNumber + 1)
        while ((possiblePrimeNumber < flags.count) && !flags[possiblePrimeNumber]) {
            possiblePrimeNumber += 1
        }
        return possiblePrimeNumber
    }
}