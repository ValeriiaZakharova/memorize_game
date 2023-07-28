//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 27.07.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚌", "✈️", "🚘", "🚇", "🚞", "🚜", "🚓", "🚑", "🏍️", "🚢", "🚁", "⛵️", "🚀", "🛰️", "💺", "⚓️", "🛺", "🛴", "🚤", "🚲", "🛞", "🚒", "🛟", "🛶", "🚨", "🛻"]
    
    private static  func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 9) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
       
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose( _ card: Card) {
        //objectWillChange.send() don;t need to specify that if we have @Published
        model.choose(card)
    }
}
