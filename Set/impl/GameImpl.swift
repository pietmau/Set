import Foundation

public class GameImpl: Game {
    public var dealtCards: [Card?] = []
    public var selectedCards: [Card] = []
    public var remainingCards: [Card] = []
    public var matchedCards: [Card] = []

    init() {
        remainingCards = Card.createAll()
        deal()
        deal()
        deal()
        deal()
    }

    public func deal() {
        addToMatchedIfAppropriate()
        addCards()
        unselctCards()
    }

    private func addCards() {
        if var toBeDealt = getThreeCards() {
            for index in dealtCards.indices {
                if (toBeDealt.isEmpty) {
                    return
                }
                let currentcard = dealtCards[index]
                if ((currentcard == nil) || (matchedCards.contains(currentcard!))) {
                    dealtCards[index] = toBeDealt.removeFirst()
                }
            }
            dealtCards.append(contentsOf: toBeDealt)
        }
    }

    private func getThreeCards() -> [Card?]? {
        var result: [Card] = []
        for _ in 1...3 {
            let rand = Int(arc4random_uniform(UInt32(remainingCards.count)))
            let card = remainingCards.remove(at: rand)
            result.append(card)
        }
        return result
    }

    private func unselctCards() {
        selectedCards.removeAll()
    }

    private func addToMatchedIfAppropriate() {
        if (!isAMatch()) {
            return
        }
        matchedCards.append(contentsOf: selectedCards)
    }

    private func isAMatch() -> Bool {
        if (selectedCards.count != 3) {
            return false
        }
        return true
    }

    public func selectCard(at: Int) {
    }
}
