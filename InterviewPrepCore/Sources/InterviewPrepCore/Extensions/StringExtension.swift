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
}