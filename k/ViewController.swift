//
//  ViewController.swift
//  Concentration
//
//  Created by Dias Muratbayev on 13.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = concentrationGame(numberOfPairsCard: (buttonCollenction.count + 1)/2 )
    var touches = 0 {
        didSet{
            touchLabel.text = "Touches:\(touches )"
        }
    }
    
    
    var emojiCollection = ["🐼","🦁","🐶","🐱","🐻","🐵","🐯","🐋"]
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifier(for card:Card) -> String{
        if emojiDictionary[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at:randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel(){
        for index in buttonCollenction.indices{
            let button  = buttonCollenction[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emojiIdentifier(for:card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.09836370498, green: 0.4856301546, blue: 0.9116933942, alpha: 0): #colorLiteral(red: 0.09836370498, green: 0.4856301546, blue: 0.9116933942, alpha: 1)
            }
        }
    }
    
    @IBOutlet var buttonCollenction: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonTouch(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollenction.firstIndex(of: sender)
        {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
        
    }
}

