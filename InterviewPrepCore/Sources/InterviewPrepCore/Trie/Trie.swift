//
// Created by Zach Miller on 18/01/2020.
//

private class TrieNode {
    let children: [Character: TrieNode] = [:]
    var endOfWord = false
}

class Trie {
    // Properties
    private let root = TrieNode()

    // Methods
    func insert(word: String) {

    }

    func containsWordWithPrefix(_ prefix: String) -> Bool {
        false
    }

    func containsWholeWord(_ word: String) -> Bool {
        false
    }

    func deleteWholeWord(_ word: String) {

    }
}
