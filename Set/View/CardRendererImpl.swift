import Foundation
import UIKit

class CardRendererImpl: CardRenderer {

    func renderCards(_ cards: [UIButton]!, _ dealtCard: [Card?]) {
        for i in 0..<dealtCard.count {
            render(button: cards[i], card: dealtCard[i])
        }
        for i in dealtCard.count..<cards.count {
              hideCardContents(cards[i])
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
        button.setTitle("", for: .normal)
    }

    private func getAttributed(card: Card) -> NSAttributedString {
        let attrs: [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.strokeColor: getColor(card),
            NSAttributedStringKey.strokeWidth: getStroke(card),
            NSAttributedStringKey.foregroundColor: getColor(card).withAlphaComponent(getAlpha(card)),
        ]
        return NSAttributedString(string: getTitle(card), attributes: attrs)
    }

    private func getAlpha(_ card: Card) -> CGFloat {
        switch (card.shading) {
        case Shading.FIRST:
            return 1
        case Shading.SECOND:
            return 1
        case Shading.THIRD:
            return 0.40
        }
    }

    private func getStroke(_ card: Card) -> Int {
        switch (card.shading) {
        case Shading.FIRST:
            return 5
        case Shading.SECOND:
            return -5
        case Shading.THIRD:
            return 0
        }
    }

    private func renderCard(button: UIButton, card: Card) {
        let attributedString: NSAttributedString = getAttributed(card: card)
        button.setAttributedTitle(attributedString, for: .normal)
    }


    private func getColor(_ card: Card) -> UIColor {
        switch (card.color) {
        case Color.FIRST:
            return .blue
        case Color.SECOND:
            return .magenta
        case Color.THIRD:
            return .yellow
        }
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
        switch (card.shape) {
        case Shape.FIRST:
            return "■"
        case Shape.SECOND:
            return "▲"
        case Shape.THIRD:
            return "●"
        }
    }
}
