//
// Created by Zach Miller on 23/01/2020.
//

extension String {
    func containsUniqueCharacters() -> Bool {
        var seenCharacters = Set<Character>()
        for character in self {
            if seenCharacters.contains(character) {
                return false
            } else {
                seenCharacters.insert(character)
            }
        }
        return true
    }

    func isPermutation(of otherString: String) -> Bool {
        guard (self.count == otherString.count) else {
            return false
        }
        var characterCounts: [Character: Int] = [:]
        for character in self {
            if let count = characterCounts[character] {
                characterCounts[character] = (count + 1)
            } else {
                characterCounts[character] = 1
            }
        }
        for character in otherString {
            if let count = characterCounts[character], (count > 0) {
                characterCounts[character] = (count - 1)
            } else {
                return false
            }
        }
        return true
    }

    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// Write a method to replace all spaces in a string with '%20'.
    /// You may assume that the string has sufficient space at the end to hold the additional characters, and that you are given the "true" length of the string.
    mutating func replaceSpacesWithPercent20(trueLength: Int) {
        let space = Character(" ")
        let percent20 = "%20"
        var removalIndex = self.index(self.startIndex, offsetBy: (trueLength - 1))
        var insertionIndex = self.index(before: self.endIndex)
        for _ in (0..<trueLength) {
            let currentCharacter = self[removalIndex]
            let insertionRangeEnd = self.index(after: insertionIndex)
            let insertionRangeStart: String.Index
            let insertionString: String
            if (currentCharacter == space) {
                insertionRangeStart = self.index(insertionIndex, offsetBy: -2)
                insertionString = percent20
            } else {
                insertionRangeStart = insertionIndex
                insertionString = String(currentCharacter)
            }
            let insertionRange = (insertionRangeStart..<insertionRangeEnd)
            self.replaceSubrange(insertionRange, with: insertionString)
            if (removalIndex > self.startIndex) {
                removalIndex = self.index(before: removalIndex)
                insertionIndex = self.index(before: insertionRangeStart)
            } // Else, the for-loop will end
        }
    }
}