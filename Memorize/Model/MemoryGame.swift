//
//  MemoryGame.swift
//  Memorize
//
//  Created by Prabaljit Walia on 15/07/21.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent:Equatable{
    private(set) var cards:Array<Card>
    
    private var indexOfOneAndOnlyOneFaceUpCard:Int?{
        get{
            let faceUpCardIndices = cards.indices.filter({ cards[$0].isFaceUp })
            return faceUpCardIndices.oneAndOnly
        }set{
            cards.indices.forEach({ index in cards[index].isFaceUp = (index == newValue) })
        }
    }
    
    mutating func choose(_ card:Card){
//        if let chosenIndex = index(of: card)
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfOneAndOnlyOneFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfOneAndOnlyOneFaceUpCard = nil
            }else{
                    for index in 0..<cards.count{
                        cards[index].isFaceUp = false
                    }
                    indexOfOneAndOnlyOneFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp.toggle()
            }
        }
    
//    func index(of card:Card)->Int?{
//        for index in 0..<cards.count{
//            if cards[index].id == card.id{
//                return index
//            }
//        }
//        return nil
//    }
    //init
    init(numberOfPairOfCards:Int, createCardContent:(Int)->CardContent) {
        cards = []
        //add numberOfPairOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    struct Card:Identifiable {
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
        var id:Int
    }
}

extension Array{
    var oneAndOnly:Element?{
        if count == 1{
            return first
        }else{
            return nil
        }
    }
}
