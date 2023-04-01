//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Chloe Chen on 3/26/23.
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
