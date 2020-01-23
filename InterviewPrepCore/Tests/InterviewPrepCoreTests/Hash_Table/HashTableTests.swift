//
// Created by Zach Miller on 23/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class HashTableTests: XCTestCase {
}

// Test Cases for Subscript
extension HashTableTests {
    func test_Subscript() {
        let hashTable = HashTable<String, Int>()

        hashTable["Zach"] = 27 // Insert
        XCTAssertEqual(hashTable["Zach"], 27)

        hashTable["Zach"] = 37 // Update
        XCTAssertEqual(hashTable["Zach"], 37)

        hashTable["Eitan"] = 26 // Insert
        XCTAssertEqual(hashTable["Eitan"], 26)

        hashTable["Eitan"] = 36 // Update
        XCTAssertEqual(hashTable["Eitan"], 36)

        hashTable["Sydney"] = 24 // Insert
        XCTAssertEqual(hashTable["Sydney"], 24)

        hashTable["Sydney"] = 34 // Update
        XCTAssertEqual(hashTable["Sydney"], 34)

        hashTable["Shoshi"] = 22 // Insert
        XCTAssertEqual(hashTable["Shoshi"], 22)

        hashTable["Zoe"] = 15 // Insert
        XCTAssertEqual(hashTable["Zoe"], 15)

        hashTable["Shoshi"] = nil // Delete
        XCTAssertNil(hashTable["Shoshi"])

        hashTable["Zoe"] = nil // Delete
        XCTAssertNil(hashTable["Zoe"])

        hashTable["Shoshi"] = 32 // Insert After Deletion
        XCTAssertEqual(hashTable["Shoshi"], 32)

        hashTable["Zach"] = nil // Delete
        XCTAssertNil(hashTable["Zach"])

        hashTable["Eitan"] = nil // Delete
        XCTAssertNil(hashTable["Eitan"])

        hashTable["Zoe"] = 25 // Insert After Deletion 
        XCTAssertEqual(hashTable["Zoe"], 25)

        hashTable["Sydney"] = nil // Delete
        XCTAssertNil(hashTable["Sydney"])
    }
}