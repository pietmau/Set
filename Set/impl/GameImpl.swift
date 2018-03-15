import Foundation

public class GameImpl: Game {
    public var dealtCards: [Card?] = []
    public var selectedCards: [Card] = []
    public var remainingCards: [Card] = []
    public var matchedCards: [Card] = []

    private let matcher: Matcher

    init(matcher: Matcher) {
        self.matcher = matcher
        remainingCards = Card.createAll()
        for _ in 1...4 {
            dealAndUnselect()
        }
    }

    public func dealAndUnselect() {
        deal()
        unselctCards()
    }

    private func deal() {
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

    private func clearAndDeal(card: Card) {
        matchedCards.append(contentsOf: selectedCards)
        clearIfNeededAndAppend(card: card)
        deal()
    }

    private func isAMatch() -> Bool {
        return matcher.isAMatch(cards: selectedCards)
    }

    public func selectCard(at: Int) {
        if (at < 0 && at >= dealtCards.count) {
            return
        }
        let card: Card = dealtCards[at]!
        if selectedCards.contains(card) {
            onCardAlreadySelected(card)
            return
        }
        if (isAMatch()) {
            clearAndDeal(card: card)
        } else {
            clearIfNeededAndAppend(card: card)
        }
    }

    private func onCardAlreadySelected(_ card: Card) {

    }


    private func clearIfNeededAndAppend(card: Card) {
        if (moreThanThreeSelected()) {
            unselctCards()
        }
        selectedCards.append(card)
    }

    private func moreThanThreeSelected() -> Bool {
        return selectedCards.count >= 3
    }

}
