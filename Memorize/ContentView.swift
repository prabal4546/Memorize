//
//  ContentView.swift
//  Memorize
//
//  Created by Prabaljit Walia on 14/07/21.
//

import SwiftUI

struct ContentView: View {
    var viewModel:EmojiMemoryGame
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 85))]){
                    ForEach(viewModel.cards){card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                        
                    }
                }
            }.foregroundColor(.red)
            .padding(.horizontal)

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        
    }
}

struct CardView:View{
    let card:MemoryGame<String>.Card
    var body:some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 30)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(lineWidth: 6)
                Text(card.content)
                    .foregroundColor(.black)
            }
            else{
                RoundedRectangle(cornerRadius: 30)
                    .fill()
            }

        }
    }
}


