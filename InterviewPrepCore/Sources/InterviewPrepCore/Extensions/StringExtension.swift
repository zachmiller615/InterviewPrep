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
}