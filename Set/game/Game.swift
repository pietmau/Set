import Foundation

public protocol Game {
    var dealtCards: [Card?] { get }
    var selectedCards: [Card] { get }
    var remainingCards: [Card] { get }
    var matchedCards: [Card] { get }

    func deal()

    func selectCard(at: Int)


}

