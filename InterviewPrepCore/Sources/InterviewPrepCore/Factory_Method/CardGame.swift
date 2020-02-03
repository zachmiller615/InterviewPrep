//
// Created by Zach Miller on 27/01/2020.
//

/// Inspired by "Cracking the Coding Interview" by Gayle Laakmann Mcdowell
enum GameType {
    case poker
    case blackjack
}

class CardGame {
    static func createCardGame(ofType gameType: GameType) -> CardGame {
        switch gameType {
        case .poker:
            return PokerGame()
        case .blackjack:
            return BlackJackGame()
        }
    }
}

class PokerGame: CardGame {
}

class BlackJackGame: CardGame {
}