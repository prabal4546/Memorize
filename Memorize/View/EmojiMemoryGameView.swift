//
//  ContentView.swift
//  Memorize
//
//  Created by Prabaljit Walia on 14/07/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game:EmojiMemoryGame
    var body: some View {
        VStack {
            AspectVGrid(items:game.cards, aspectRatio: 2/3, content:{card in
                if card.isMatched && !card.isFaceUp{
                    Rectangle().opacity(0)
                }else{
                    CardView(card: card)
                        .padding(4)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            })
            .foregroundColor(.red)
            .padding(.horizontal)

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        
    }
}

struct CardView:View{
    let card:EmojiMemoryGame.Card
    var body:some View{
        GeometryReader(content: { geometry in
            ZStack{
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: 30)
                        .fill()
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(lineWidth: 6)
                    Text(card.content)
                        .font(Font.system(size: min( geometry.size.width, geometry.size.height )))
                        .foregroundColor(.black)
                }
                else if card.isMatched{
                    RoundedRectangle(cornerRadius: 10)
                        .opacity(0)
                }
                else{
                    RoundedRectangle(cornerRadius: 10)
                        .fill()
                }
                

            }
        })
    }
}


