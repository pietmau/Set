import Foundation

protocol Game {
    var cards: [Card?] { get }

    func deal()

    func selectCard(at: Int)


}

