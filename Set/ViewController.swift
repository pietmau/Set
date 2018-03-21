import UIKit

class ViewController: UIViewController {
    var game: Game = GameImpl(matcher: Positivematcher())
    let renderer: CardRenderer = CardRendererImpl()

    @IBOutlet var cards: [UIButton]!

    @IBOutlet weak var dealButton: UIButton!

    @IBAction func onDealClicked(_ sender: Any) {
        game.deal()
        updateView()
    }

    @IBAction func onButtoClicked(_ sender: UIButton) {
        let index = cards.index(of: sender)!
        game.selectCard(at: index)
        updateView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func updateView() {
        renderer.renderCards(cards, game.dealtCards)
        renderer.setCardsSelected(cards, game.dealtCards, game.selectedCards)
        dealButton.isEnabled = game.dealtCards.count < cards.count && game.canDeal
    }

}

