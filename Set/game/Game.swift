import Foundation

public protocol Game {
    var dealtCards: [Card?] { get }
    var selectedCards: [Card] { get }
    var remainingCards: [Card] { get }
    var matchedCards: [Card] { get }

    func dealAndUnselect()

    func selectCard(at: Int)


}

