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
        self.deleteWholeWord(word: word, currentIndex: word.startIndex, currentNode: self.root)
    }
}

// Private Methods
private extension Trie {
    // Boolean return type indicates if current link to child node should be removed
    @discardableResult
    func deleteWholeWord(word: String, currentIndex: String.Index, currentNode: TrieNode) -> Bool {
        let atEndOfWordToBeDeleted = (currentIndex == word.endIndex)
        if atEndOfWordToBeDeleted {
            if (!currentNode.endOfWord) {
                return false // The word to be deleted is not in the trie
            }
            currentNode.endOfWord = false // Delete the word from the trie
            return currentNode.children.isEmpty // Decide if current node can be removed
        }
        let letter = word[currentIndex]
        guard let childNode = currentNode.children[letter] else {
            return false // The word to be deleted is not in the trie
        }
        let nextIndex = word.index(after: currentIndex)
        let shouldRemoveChildLink = self.deleteWholeWord(word: word, currentIndex: nextIndex, currentNode: childNode)
        if (shouldRemoveChildLink) {
            currentNode.children[letter] = nil
            return currentNode.children.isEmpty // Decide if the current node can be deleted as well
        } else {
            return false // All necessary child links have been removed or word was not in the trie
        }
    }
}
