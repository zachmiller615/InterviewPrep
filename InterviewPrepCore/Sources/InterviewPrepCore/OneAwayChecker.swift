//
// Created by Zach Miller on 19/03/2020.
//

struct OneAwayChecker {
    // Properties
    let largerString: String
    let smallerString: String

    // Initializer
    init(string1: String, string2: String) {
        let string1IsLarger = (string1.count > string2.count)
        self.largerString = string1IsLarger ? string1 : string2
        self.smallerString = string1IsLarger ? string2 : string1
    }

    // Methods

    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character.
    /// Given two strings, write a function to check if they are one edit (or zero edits) away.
    func stringsAreAtMostOneEditAway() -> Bool {
        let stringLengthDifference = (self.largerString.count - self.smallerString.count)
        if (stringLengthDifference > 1) {
            return false
        }
        if (stringLengthDifference == 1) {
            return self.stringsAreAtMostOneInsertAway()
        }
        return self.stringsAreAtMostOneUpdateAway()
    }
}

// Private Methods
private extension OneAwayChecker {
    func stringsAreAtMostOneUpdateAway() -> Bool {
        var hasSeenOneUpdate = false
        var currentIndex = self.largerString.startIndex
        while (currentIndex < self.largerString.endIndex) {
            let largerStringCharacter = self.largerString[currentIndex]
            let smallerStringCharacter = self.smallerString[currentIndex]
            if (largerStringCharacter != smallerStringCharacter) {
                if hasSeenOneUpdate {
                    return false
                } else {
                    hasSeenOneUpdate = true
                }
            }
            currentIndex = self.largerString.index(after: currentIndex)
        }
        return true
    }

    // Assumes string length difference is 1
    func stringsAreAtMostOneInsertAway() -> Bool {
        var hasSeenOneInsert = false
        var largerStringIndex = self.largerString.startIndex
        var smallerStringIndex = self.smallerString.startIndex
        while (smallerStringIndex < self.smallerString.endIndex) {
            let largerStringCharacter = self.largerString[largerStringIndex]
            let smallerStringCharacter = self.smallerString[smallerStringIndex]
            if (largerStringCharacter != smallerStringCharacter) {
                if hasSeenOneInsert {
                    return false
                }
                hasSeenOneInsert = true
                largerStringIndex = self.largerString.index(after: largerStringIndex)
                continue
            }
            largerStringIndex = self.largerString.index(after: largerStringIndex)
            smallerStringIndex = self.smallerString.index(after: smallerStringIndex)
        }
        return true
    }
}
