//
//  ViewController.swift
//  Set
//
//  Created by Maurizio Pietrantuono on 13/03/2018.
//  Copyright © 2018 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game: Game = GameImpl(matcher: MatcherImpl())
    let renderer: CardRenderer = CardRendererImpl()

    @IBOutlet var cards: [UIButton]!

    @IBAction func onDealClicked(_ sender: Any) {

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
    }

}

