//
// Created by Zach Miller on 27/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class RestaurantTests: XCTestCase {
}

// Test Cases for Shared Instance
extension RestaurantTests {
    func test_Restaurant_SharedInstance() {
        // Given
        let restaurant1 = Restaurant.sharedInstance
        let restaurant2 = Restaurant.sharedInstance

        // When
        let referencesReferToSameObject = (restaurant1 === restaurant2)

        // Then
        XCTAssertTrue(referencesReferToSameObject)
    }
}