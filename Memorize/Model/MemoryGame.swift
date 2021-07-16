//
//  MemoryGame.swift
//  Memorize
//
//  Created by Prabaljit Walia on 15/07/21.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards:Array<Card>
    
    func choose(_ card:Card){
        
    }
    //init
    init(numberOfPairOfCards:Int, createCardContent:(Int)->CardContent) {
        cards = Array<Card>()
        //add numberOfPairOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    struct Card:Identifiable {
        var isFaceUp:Bool = true
        var isMatched:Bool = false
        var content:CardContent
        var id:Int
    }
}
