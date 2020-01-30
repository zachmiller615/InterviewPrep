//
// Created by Zach Miller on 30/01/2020.
//

import Foundation

extension Int {
    var numberOfDigits: Int {
        var changingNumber = self
        var digitsCount = 0
        while (changingNumber != 0) {
            changingNumber = (changingNumber / 10)
            digitsCount += 1
        }
        return digitsCount
    }

    func getDigitValue(offsetFromOnesPlace: Int) -> Int? {
        guard (offsetFromOnesPlace >= 0) else {
            return nil
        }
        let numerator = abs(self)
        let denominator = pow(10, offsetFromOnesPlace)
        let castedDenominator = Int(truncating: NSDecimalNumber(decimal: denominator))
        let shiftedNumber = (numerator / castedDenominator)
        return (shiftedNumber % 10)
    }
}