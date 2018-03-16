import Foundation
import UIKit

class CardRendererImpl: CardRenderer {

    func renderCards(_ cards: [UIButton]!, _ dealtCard: [Card?]) {
        for i in 0..<dealtCard.count {
            render(button: cards[i], card: dealtCard[i])
        }

    }


    private func render(button: UIButton, card: Card?) {
        if let card = card {
            renderCard(button: button, card: card)
        } else {
            hideCardContents(button)
        }
    }

    private func hideCardContents(_ button: UIButton) {

    }

    private func renderCard(button: UIButton, card: Card) {
        button.setTitle(getTitle(card), for: .normal)
        let color = getColor(card)
        button.setTitleColor(color, for: .normal)
    }

    private func getColor(_ card: Card) -> UIColor {
        if (card.shape == Shape.FIRST) {
            return .blue
        }
        if (card.shape == Shape.SECOND) {
            return .magenta
        }
        if (card.shape == Shape.THIRD) {
            return .yellow
        }
        fatalError("Cannot get here")
    }

    private func getTitle(_ card: Card) -> String {
        var title = ""
        let symbol = getSymbol(card)
        for _ in 1...card.number {
            title = title + symbol
        }
        return title
    }

    private func getSymbol(_ card: Card) -> String {
        if (card.shape == Shape.FIRST) {
            return "■"
        }
        if (card.shape == Shape.SECOND) {
            return "▲"
        }
        if (card.shape == Shape.THIRD) {
            return "●"
        }
        fatalError("Cannot get here")
    }
}
