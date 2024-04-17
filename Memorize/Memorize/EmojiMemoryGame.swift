//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Taylor Zeller on 4/16/24.
//

import SwiftUI

//func createCardContent (forPairAtIndex index: Int) -> String {
//    return ["👺","🤡","👽","🤖","👻","☠️","👑","💍","🦆","👀","🧀","🤍"][index]
//}

class EmojiMemoryGame {
    private static let emojis = ["👺","🤡","👽","🤖","👻","☠️","👑","💍","🦆","👀","🧀","🤍"]
    
    private static func CreateMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    private var game = CreateMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        game.choose(card)
    }
}
