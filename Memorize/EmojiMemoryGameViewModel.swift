//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 27.07.2023.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> =
        MemoryGame<String>(numberOfPairsOfCards: 4) { index in "🚨" }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
