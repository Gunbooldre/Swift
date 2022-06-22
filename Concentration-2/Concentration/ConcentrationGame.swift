//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Dias Muratbayev on 15.05.2022.
//

import Foundation

class concentrationGame{
    var cards = [Card]()
    
    var indeOfFaceUpCard:Int?
    func chooseCard(at index:Int){
        if !cards[index].isMatched{
            if let matchedIndex = indeOfFaceUpCard,matchedIndex != index{
                if cards[matchedIndex].identifier == cards[index].identifier{
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indeOfFaceUpCard = nil
            }else{
                for flipDown in  cards.indices{
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indeOfFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsCard:Int){
        for _ in 1...numberOfPairsCard{
            let card = Card()
            //cards.append(card)
            //cards.append(card)
            cards+=[card,card]
        }
    }
}
