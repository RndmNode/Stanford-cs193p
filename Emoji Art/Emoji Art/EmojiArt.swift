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
            selected: false,
            id: uniqueEmojiID
        ))
    }
    
    mutating func selectEmoji (id emojiID: Int) {
        let emojiIndex: Int? = getEmojiIndex(id: emojiID)
        if emojiIndex != nil {
            let index = emojiIndex!
            emojis[index].selected = !emojis[index].selected
            print("Tapped on ", emojis[index].string, " at (", emojis[index].position.x, ",", emojis[index].position.y, ")")
        } else {
            print("ERROR: Emoji id not found in model's emojis array")
        }
    }
    
    func getEmojiIndex(id emojiID: Int) -> Int? {
        var i = 0
        for emoji in emojis {
            if emoji.id == emojiID {
                return i
            } else {
                i += 1
            }
        }
        return nil
    }
    
    struct Emoji: Identifiable {
        let string: String
        var position: Position
        var size: Int
        var selected: Bool
        var id: Int
        
        struct Position {
            var x: Int
            var y: Int
            
            static let zero = Self(x: 0, y: 0)
        }
    }
}
