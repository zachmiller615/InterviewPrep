//
// Created by Zach Miller on 23/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class StringExtensionTests: XCTestCase {
}

// Test Cases for Contains Unique Characters
extension StringExtensionTests {
    func test_ContainsUniqueCharacters_True() {
        XCTAssertTrue("ABCDEFGH".containsUniqueCharacters())
    }

    func test_ContainsUniqueCharacters_False() {
        XCTAssertFalse("ABCDEFGA".containsUniqueCharacters())
    }
}