//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 24.07.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
