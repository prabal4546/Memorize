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
            VStack{
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
                HStack{
                        Image(systemName: "ellipsis.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .contextMenu(ContextMenu(menuItems: {
                                Button{
                                    //do something
                                } label:{
                                    Label("Vehicle", systemImage:"globe")
                                }
                                Button{
                                    //do something
                                } label:{
                                    Label("Phone", systemImage:"camera")
                                }
                                Button{
                                    //do something
                                } label:{
                                    Label("New", systemImage:"appletv")
                                }
                            }))
                    Spacer()
                    
                }
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
    var body: some View {
            GeometryReader { geometry in
                ZStack {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                            .padding(5)
                            .opacity(0.5)
                        Text(card.content)
                            .font(Memorize.font(in: geometry.size))
                }
                .cardify(isFaceUp: card.isFaceUp)
            }
    }

}
private struct DrawingConstants {
    static let cornerRadius: CGFloat = 10
    static let lineWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.7
}


private func font(in size: CGSize) -> Font {
   Font.system(size: min(size.width, size.height)*DrawingConstants.fontScale)
}
