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
//            ScrollView {
//                LazyVGrid(columns:[GridItem(.adaptive(minimum: 85))]){
//                    ForEach(game.cards){card in
            
            AspectVGrid(items:game.cards, aspectRatio: 2/3, content:{card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            })
                        
//                    }
//                }
//            }
            .foregroundColor(.red)
            .padding(.horizontal)

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
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
                    RoundedRectangle(cornerRadius: 30)
                        .opacity(0)
                }
                else{
                    RoundedRectangle(cornerRadius: 30)
                        .fill()
                }
                

            }
        })
    }
}


