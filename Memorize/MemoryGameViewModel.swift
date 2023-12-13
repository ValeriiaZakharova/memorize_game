//
//  MemoryGame.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 27.07.2023.
//

import UIKit

struct MemoryGameViewModel<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter ({ cards[$0].isFaceUP }).only }
        set { cards.indices.forEach { cards[$0].isFaceUP = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUP,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUP = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    struct Card: Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            "\(id): \(content) \(isFaceUP ? "up": "down") \(isMatched ? "matched" : "notMtched")"
        }
        
        var isFaceUP = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
