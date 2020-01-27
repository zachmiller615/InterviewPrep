//
// Created by Zach Miller on 27/01/2020.
//

import XCTest
@testable import InterviewPrepCore

class CardGameTests: XCTestCase {
}

// Test Cases for Create Card Game
extension CardGameTests {
    func test_CardGame_CreateCardGame_Poker() {
        // Given
        let cardGame = CardGame.createCardGame(ofType: .poker)

        // When
        let cardGameIsPoker = (cardGame is PokerGame)

        // Then
        XCTAssertTrue(cardGameIsPoker)
    }

    func test_CardGame_CreateCardGame_BlackJack() {
        // Given
        let cardGame = CardGame.createCardGame(ofType: .blackjack)

        // When
        let cardGameIsBlackJack = (cardGame is BlackJackGame)

        // Then
        XCTAssertTrue(cardGameIsBlackJack)
    }
}