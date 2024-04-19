//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Taylor Matzeller on 4/16/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        // add number of cards * 2
        for pairIndex in 0..<max(2, numPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatch = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[potentialMatch].content == cards[chosenIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatch].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp  = true
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id): \(content)"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
