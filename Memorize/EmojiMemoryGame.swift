//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 27.07.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGameViewModel<String>.Card
    
    private static let emojis = ["🚌", "✈️", "🚘", "🚇", "🚞", "🚜", "🚓", "🚑", "🏍️", "🚢", "🚁", "⛵️", "🚀", "🛰️", "💺", "⚓️", "🛺", "🛴", "🚤", "🚲", "🛞", "🚒", "🛟", "🛶", "🚨", "🛻"]
    
    private static  func createMemoryGame() -> MemoryGameViewModel<String> {
        MemoryGameViewModel<String>(numberOfPairsOfCards: 10) { pairIndex in
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
    
    func shuffle() {
        model.shuffle()
    }
}
