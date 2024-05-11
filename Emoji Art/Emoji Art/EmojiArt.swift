//
//  EmojiArt.swift
//  Emoji Art
//
//  Created by Taylor Zeller on 4/22/24.
//

import Foundation

struct EmojiArt : Codable {
    var background: URL?
    private(set) var emojis = [Emoji]()
    
    init(json: Data) throws {
        self = try JSONDecoder().decode(EmojiArt.self, from: json)
    }
    
    init() {
        
    }
    
    func json() throws -> Data {
        let encoded = try JSONEncoder().encode(self)
        print("EmopjiArt = \(String(data: encoded, encoding: .utf8) ?? "nil")")
        return encoded
    }
    
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
    
    struct Emoji: Identifiable, Codable {
        let string: String
        var position: Position
        var size: Int
        var id: Int
        
        struct Position : Codable {
            var x: Int
            var y: Int
            
            static let zero = Self(x: 0, y: 0)
        }
    }
}
