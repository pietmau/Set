import XCTest
@testable import Set

public class MatcherTest: XCTestCase {
    public var matcher: Matcher? = nil
    public var cards: [Card] = []

    public override func setUp() {
        super.setUp()
        matcher = MatcherImpl()
    }

    public override func tearDown() {
        super.tearDown()
    }

    public func test_empty() {
        XCTAssert(!matcher!.isAMatch(cards: cards))
    }

    public func test_toomany() {
        putTooMany()
        XCTAssert(!matcher!.isAMatch(cards: cards))
    }

    private func putTooMany() {
        let card = Card(number: 1, shape: Shape.FIRST, color: Color.FIRST, shading: Shading.FIRST)
        let card1 = Card(number: 2, shape: Shape.SECOND, color: Color.SECOND, shading: Shading.SECOND)
        let card2 = Card(number: 3, shape: Shape.THIRD, color: Color.THIRD, shading: Shading.THIRD)
        let card3 = Card(number: 2, shape: Shape.FIRST, color: Color.FIRST, shading: Shading.FIRST)
        cards.append(card)
        cards.append(card1)
        cards.append(card2)
        cards.append(card3)
    }
}

