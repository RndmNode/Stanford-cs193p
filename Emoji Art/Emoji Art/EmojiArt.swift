//
//  EmojiArt.swift
//  Emoji Art
//
//  Created by Taylor Zeller on 4/22/24.
//

import Foundation

struct EmojiArt {
    var background: URL?
    private(set) var emojis = [Emoji]()
    
    private var uniqueEmojiID = 0
    
    mutating func addEmoji (_ emoji: String, at position: Emoji.Position, size: Int) {
        uniqueEmojiID += 1
        emojis.append(Emoji(
            string: emoji,
            position: position,
            size: size,
            id: uniqueEmojiID
        ))
    }
    
    struct Emoji:  Identifiable{
        let string: String
        var position: Position
        var size: Int
        var id: Int
        
        struct Position {
            var x: Int
            var y: Int
        }
    }
}
