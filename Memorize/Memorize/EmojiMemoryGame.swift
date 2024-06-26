//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Taylor Zeller on 4/16/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👺","🤡","👽","🤖","👻","☠️","👑","💍","🦆","👀","🧀","🤍"]
    
    private static func CreateMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var game = CreateMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    var score: Int {
        game.score
    }
    
    // MARK: - Intents
    
    func shuffle(){
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        game.choose(card)
    }
}
