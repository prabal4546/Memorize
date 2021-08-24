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
        LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing:0){
            ForEach(items){item in
                content(item).aspectRatio(aspectRatio, contentMode: .fit)
            }
        }
    }
}
private func adaptiveGridItem(width:CGFloat)->GridItem{
    var gridItem = GridItem(.adaptive(minimum: width))
    gridItem.spacing = 0
    return gridItem
}
private func widthThatFits(itemCount: Int, in size:CGSize, itemAspectRatio:CGFloat)->CGFloat{
    var columnCount = 1
    var rowCount = itemCount
    repeat{
        let itemWidth = size.width
        let itemHeight = itemWidth/itemAspectRatio
        if CGFloat(rowCount) * itemHeight < size.height{
            break
        }
        columnCount += 1
        rowCount = (itemCount + (columnCount - 1))/columnCount
    } while columnCount<itemCount
        if columnCount>itemCount{
        columnCount = itemCount
    }
    return floor(size.width/CGFloat(columnCount))
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}

