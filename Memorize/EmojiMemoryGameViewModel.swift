//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 27.07.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚌", "✈️", "🚘", "🚇", "🚞", "🚜", "🚓", "🚑", "🏍️", "🚢", "🚁", "⛵️", "🚀", "🛰️", "💺", "⚓️", "🛺", "🛴", "🚤", "🚲", "🛞", "🚒", "🛟", "🛶", "🚨", "🛻"]
    
    static  func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
       
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose( _ card: MemoryGame<String>.Card) {
        //objectWillChange.send() don;t need to specify that if we have @Published
        model.choose(card)
    }
}
