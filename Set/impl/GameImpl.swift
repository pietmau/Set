import Foundation

class GameImpl: Game {
    var dealtCards: [Card?] = []
    var selectedCards: [Card] = []

    private var remainingCards: [Card] = []
    private var matchedCards: [Card] = []

    init() {
        remainingCards = Card.createAll()
        deal()
        deal()
        deal()
    }

    func deal() {
        addToIfIsaMatchMatchedCards()
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
            if (toBeDealt.isEmpty) {
                return
            }
            dealtCards.append(contentsOf: toBeDealt)
        }
    }

    private func getThreeCards() -> [Card?]? {
        var result: [Card] = []
        for index in 1...3 {
            let rand = Int(arc4random_uniform(UInt32(remainingCards.count)))
            let card = remainingCards.remove(at: rand)
            result.append(card)
        }
        return result
    }

    private func unselctCards() {
        selectedCards.removeAll()
    }

    private func addToIfIsaMatchMatchedCards() {
        if (!isAMatch()) {
            return
        }
        matchedCards.append(contentsOf: selectedCards)
    }

    private func isAMatch() -> Bool {
        fatalError("isAMatch() has not been implemented")
    }

    func selectCard(at: Int) {
    }
}
