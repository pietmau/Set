import XCTest
@testable import Set

public class DealTests: XCTestCase {
    public var game: Game? = nil

    public override func setUp() {
        super.setUp()
        game = GameImpl(matcher: NegativeMatcher())
    }

    public override func tearDown() {
        super.tearDown()
    }

    func test_deal() {
        let initlaiCards = game!.dealtCards
        game!.deal()
        let finalCards = game!.dealtCards
        XCTAssert(finalCards.count == initlaiCards.count + 3)
        XCTAssert(finalCards.count == 15)
    }

    func test_match_and_deal() {
//        game = GameImpl(matcher: Positivematcher())
//        game.selectCard(at: 0)
//        game.selectCard(at: 1)
//        game.selectCard(at: 2)
//        let initlaiCards = game!.dealtCards
//        game!.deal()
//        let finalCards = game!.dealtCards
//        XCTAssert(finalCards.count == initlaiCards.count + 3)
//        XCTAssert(finalCards.count == 15)
    }


}

