import Foundation

struct Card: Equatable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        if (lhs.number != rhs.number) {
            return false
        }
        if (lhs.shape != rhs.shape) {
            return false
        }

        if (lhs.shading != rhs.shading) {
            return false
        }
        if (lhs.color != rhs.color) {
            return false
        }
        return true
    }

    let number: Int
    let shape: Shape
    let color: Color
    let shading: Shading

    init(number: Int, shape: Shape, color: Color, shading: Shading) {
        assert(number <= 0 || number > 3, " Number must be >0 and <4, but was \(number)")
        self.number = number
        self.shape = shape
        self.color = color
        self.shading = shading
    }

    static func createAll() -> [Card] {
        var cards: [Card] = []
        for number in 1...3 {
            for shape in Shape.getValues() {
                for color in Color.getValues() {
                    for shading in Shading.getValues() {
                        let card = Card(number: number, shape: shape, color: color, shading: shading)
                        cards.append(card)
                    }
                }
            }
        }
        return cards
    }
}

enum Shape {
    case FIRST, SECOND, THIRD

    static func getValues() -> [Shape] {
        return [FIRST, SECOND, THIRD]
    }

}

enum Shading {
    case FIRST, SECOND, THIRD

    static func getValues() -> [Shading] {
        return [FIRST, SECOND, THIRD]
    }
}

enum Color {
    case FIRST, SECOND, THIRD

    static func getValues() -> [Color] {
        return [FIRST, SECOND, THIRD]
    }
}

