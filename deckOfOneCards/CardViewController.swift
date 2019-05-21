//
//  CardViewController.swift
//  deckOfOneCards
//
//  Created by Jordan Hendrickson on 5/21/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var suitLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
            updateViews()
    }
    @IBAction func shuffleButtonTapped(_ sender: Any) {
            updateViews()
    }
    
    func updateViews() {
        JNHCardController.fetchCard { (card) in
            DispatchQueue.main.async {
                guard let card = card else {return}
                self.fetchAndSetImage(for: card)
                self.suitLabel.text = card.suit
                
            }
        }
    }
    
    func fetchAndSetImage(for card: JNHCard) {
        JNHCardController.fetchImage(at: card.image) { (image) in
            DispatchQueue.main.async {
                self.cardImageView.image = image
            }
        }
    }
}
