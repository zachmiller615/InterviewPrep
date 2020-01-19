//
// Created by Zach Miller on 18/01/2020.
//

private class TrieNode {
    var children: [Character: TrieNode] = [:]
    var endOfWord = false
}

class Trie {
    // Properties
    private let root = TrieNode()

    // Methods
    func insert(word: String) {
        var currentNode = self.root
        for letter in word {
            if let childNode = currentNode.children[letter] {
                currentNode = childNode
            } else {
                let childNode = TrieNode()
                currentNode.children[letter] = childNode
                currentNode = childNode
            }
        }
        currentNode.endOfWord = true
    }

    func contains(text: String, searchType: TrieSearchType) -> Bool {
        var currentNode = self.root
        for letter in text {
            if let childNode = currentNode.children[letter] {
                currentNode = childNode
            } else {
                return false
            }
        }
        switch searchType {
        case .prefix:
            return true
        case .wholeWord:
            return currentNode.endOfWord
        }
    }

    func deleteWholeWord(_ word: String) {

    }
}
































































