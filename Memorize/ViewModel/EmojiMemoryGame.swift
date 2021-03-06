//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Prabaljit Walia on 15/07/21.
//

import SwiftUI

class EmojiMemoryGame:ObservableObject{
    typealias Card = MemoryGame<String>.Card
    static let emojis = ["🚑", "🚒", "🚐", "🛻", "🚛", "🚜", "🛺", "🚂",
                         "🚟", "✈️", "🚞", "🚝", "🚲", "🚀", "🛸", "🚁", "⛵️", "🛴", "🛵"]
    
    static func createMemoryGame()->MemoryGame<String>{
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    @Published private var model:MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card>{
       return model.cards
    }
    // MARK:- Intent
    func choose(_ card:MemoryGame<String>.Card){
        model.choose(card)
    }
}
