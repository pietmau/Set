import Foundation

class MatcherImpl: Matcher {

    func isAMatch(cards: [Card]) -> Bool {
        if (cards.count != 3) {
            return false
        }
        return true
    }
}
