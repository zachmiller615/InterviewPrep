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
        let computedResult = self.trie.contains(text: "ab", searchType: .prefix)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_ContainsWordWithPrefix_False() {
        // When
        let computedResult = self.trie.contains(text: "lo", searchType: .prefix)

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Contains Whole Word
extension TrieTests {
    func test_ContainsWholeWord_True_Example_1() {
        // When
        let computedResult = self.trie.contains(text: "lmn", searchType: .wholeWord)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_ContainsWholeWord_True_Example_2() {
        // When
        let computedResult = self.trie.contains(text: "cdf", searchType: .wholeWord)

        // Then
        XCTAssertTrue(computedResult)
    }

    func test_ContainsWholeWord_False_Example_1() {
        // When
        let computedResult = self.trie.contains(text: "ab", searchType: .wholeWord)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_ContainsWholeWord_False_Example_2() {
        // When
        let computedResult = self.trie.contains(text: "ghi", searchType: .wholeWord)

        // Then
        XCTAssertFalse(computedResult)
    }
}

// Test Cases for Delete Whole Word
extension TrieTests {
    func test_DeleteWholeWord_ExistingWord_Example_1() {
        // Given
        let word = "abc"
        XCTAssertTrue(self.trie.contains(text: word, searchType: .wholeWord))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.contains(text: word, searchType: .wholeWord)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_DeleteWholeWord_ExistingWord_Example_2() {
        // Given
        let word = "abgl"
        XCTAssertTrue(self.trie.contains(text: word, searchType: .wholeWord))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.contains(text: word, searchType: .wholeWord)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_DeleteWholeWord_ExistingWord_Example_3() {
        // Given
        let word = "abcd"
        XCTAssertTrue(self.trie.contains(text: word, searchType: .wholeWord))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.contains(text: word, searchType: .wholeWord)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_DeleteWholeWord_InputIsExistingPrefix() {
        // Given
        let word = "ab"
        XCTAssertTrue(self.trie.contains(text: word, searchType: .prefix))
        XCTAssertFalse(self.trie.contains(text: word, searchType: .wholeWord))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.contains(text: word, searchType: .wholeWord)

        // Then
        XCTAssertFalse(computedResult)
    }

    func test_DeleteWholeWord_InputDoesNotExist() {
        // Given
        let word = "abcde"
        XCTAssertFalse(self.trie.contains(text: word, searchType: .wholeWord))

        // When
        self.trie.deleteWholeWord(word)
        let computedResult = self.trie.contains(text: word, searchType: .wholeWord)

        // Then
        XCTAssertFalse(computedResult)
    }
}