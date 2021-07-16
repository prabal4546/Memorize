//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Prabaljit Walia on 15/07/21.
//

import SwiftUI

class EmojiMemoryGame{
    static let emojis = ["a","b","c","d","e","g","h"]
    
    static func createMemoryGame()->MemoryGame<String>{
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    private var model:MemoryGame<String> = createMemoryGame()
    var cards: Array<MemoryGame<String>.Card>{
       return model.cards
    }
    // MARK:- Intent
}
