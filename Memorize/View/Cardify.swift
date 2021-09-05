//
//  Cardify.swift
//  Memorize
//
//  Created by Prabaljit Walia on 02/09/21.
//

import SwiftUI

struct Cardify:ViewModifier {
    var isFaceUp:Bool
    func body(content:Content)->some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                content

            } else {
                shape.fill()
            }
        }
    }
}
private struct DrawingConstants {
    static let cornerRadius: CGFloat = 10
    static let lineWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.7
}
extension View{
    func cardify(isFaceUp:Bool)->some View{
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
