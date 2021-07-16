//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Prabaljit Walia on 14/07/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
