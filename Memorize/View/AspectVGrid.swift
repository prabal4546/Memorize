//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Prabaljit Walia on 03/08/21.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView:View, Item:Identifiable{
    var items:[Item]
    var aspectRatio:CGFloat
    var content: (Item)->ItemView
    var body: some View {
        let width:CGFloat = 100
        LazyVGrid(columns: [GridItem(.adaptive(minimum: width))]){
            ForEach(items){item in
                content(item).aspectRatio(aspectRatio, contentMode: .fit)
            }
        }
    }
}


//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
