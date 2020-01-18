//
// Created by Zach Miller on 18/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class TrieTests: XCTestCase {
    // Properties
    private var trie: Trie!

    // Methods
    override func setUp() {
        super.setUp()
        self.fillTrie()
    }

    override func tearDown() {
        self.trie = nil
        super.tearDown()
    }

    // Private Methods
    private func fillTrie() {
        self.trie = Trie()
        self.trie.insert(word: "abc")
        self.trie.insert(word: "adgl")
        self.trie.insert(word: "cdf")
        self.trie.insert(word: "abcd")
        self.trie.insert(word: "lmn")
    }
}

// Test Cases for Contains Word With Prefix
extension TrieTests {
    func test_ContainsWordWithPrefix_True() {
        // When
        let computedResult = self.trie.containsWordWithPrefix("ab")

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_ContainsWordWithPrefix_False() {
        // When
        let computedResult = self.trie.containsWordWithPrefix("lo")

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Contains Whole Word
extension TrieTests {
    func test_ContainsWholeWord_True_Example_1() {
        // When
        let computedResult = self.trie.containsWordWithPrefix("lmn")

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_ContainsWholeWord_True_Example_2() {
        // When
        let computedResult = self.trie.containsWordWithPrefix("cdf")

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_ContainsWholeWord_False_Example_1() {
        // When
        let computedResult = self.trie.containsWordWithPrefix("ab")

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_ContainsWholeWord_False_Example_2() {
        // When
        let computedResult = self.trie.containsWordWithPrefix("ghi")

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Delete Whole Word
extension TrieTests {
    func test_DeleteWholeWord_ExistingWord_Example_1() {
        // Given
        let word = "abc"
        XCTAssertTrue(self.trie.containsWholeWord(word))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.containsWholeWord(word)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_DeleteWholeWord_ExistingWord_Example_2() {
        // Given
        let word = "abgl"
        XCTAssertTrue(self.trie.containsWholeWord(word))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.containsWholeWord(word)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_DeleteWholeWord_ExistingWord_Example_3() {
        // Given
        let word = "abcd"
        XCTAssertTrue(self.trie.containsWholeWord(word))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.containsWholeWord(word)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_DeleteWholeWord_InputIsExistingPrefix() {
        // Given
        let word = "ab"
        XCTAssertTrue(self.trie.containsWordWithPrefix(word))
        XCTAssertFalse(self.trie.containsWholeWord(word))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.containsWholeWord(word)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_DeleteWholeWord_InputDoesNotExist() {
        // Given
        let word = "abcde"
        XCTAssertFalse(self.trie.containsWordWithPrefix(word))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.containsWholeWord(word)

        // Then
        XCTAssertFalse(computedResult)
    }
}