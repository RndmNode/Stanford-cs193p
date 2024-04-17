//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Taylor Matzeller on 4/16/24.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        // add number of cards * 2
        for pairIndex in 0..<max(2, numPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp  = true
        var isMatched = false
        let content: CardContent
    }
}
