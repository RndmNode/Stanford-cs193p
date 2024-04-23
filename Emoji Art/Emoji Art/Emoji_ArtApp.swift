//
//  Emoji_ArtApp.swift
//  Emoji Art
//
//  Created by Taylor Zeller on 4/22/24.
//

import SwiftUI

@main
struct Emoji_ArtApp: App {
    @StateObject var defaultDocument = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: defaultDocument)
        }
    }
}
