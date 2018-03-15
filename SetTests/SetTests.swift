

import XCTest
@testable import Set

class SetTests: XCTestCase {
    var game: Game? = nil

    override func setUp() {
        super.setUp()
        game = GameImpl()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initiallyWeAreDealtTwelevecards() {
        XCTAssert(game?.dealtCards.count == 12, "Was \(game?.dealtCards.count)")
        XCTAssert(game?.remainingCards.count == (81 - 12), "Was \(game?.remainingCards.count)")
    }

    func test_initiallySelecgtedCardsIsImpty() {
        XCTAssert(game?.selectedCards.isEmpty == true)
    }

    func test_initiallyWeAreDealtTweleveValidCards() {
        let invalid = game?.dealtCards.filter { card in
            !Card.isAValidCard(card: card!)
        }
        XCTAssert(invalid!.isEmpty)
    }

    func test_initiallyWeStartWithValidCards() {
        let invalid = game?.remainingCards.filter { card in
            !Card.isAValidCard(card: card)
        }
        XCTAssert(invalid!.isEmpty)
    }

    func test_noOverallCardsDuplicates() {
        var cards = (game?.remainingCards)!
        let cards1 = game?.dealtCards as! [Card]
        cards.append(contentsOf: cards1)
        XCTAssert(cards.count == 81)
        XCTAssert(!findDuplicates(cards: cards1))
    }

    func test_noDealtCardsDuplicates() {
        let cards1 = game?.dealtCards
        XCTAssert(!findDuplicates(cards: cards1!))
    }

    func test_noRemainingCardsDuplicates() {
        let cards = game?.remainingCards
        XCTAssert(!findDuplicates(cards: cards!))
    }

    private func findDuplicates(cards: [Card?]) -> Bool {
        var dup = false
        for i in cards.indices {
            for j in cards.indices {
                if (i != j && cards[i] == cards[j]) {
                    dup = true
                    break
                }
            }
        }
        return dup
    }
}
