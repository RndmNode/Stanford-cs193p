//
//  EmojiArtDocumentView.swift
//  Emoji Art
//
//  Created by Taylor Zeller on 4/22/24.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    typealias Emoji = EmojiArt.Emoji
    @ObservedObject var document: EmojiArtDocument
    
    private let emojis = "👑👻👮🏽‍♂️🧞‍♂️🐒🍀🪐🌪️🥩🍩🪂🚖🚔🚒🚕🚙🏎️🚑🚀🛰️⛩️🪜🕳️🧸🛎️🚽📫📦🇨🇦🇧🇬🇯🇵☢︎☣︎🫎🐙🦖🦕🦍"
    
    private let PaletteEmojiSize: CGFloat = 40
    
    var body: some View {
        VStack (spacing: 0) {
            documentBody
            ScrollingEmojis(emojis)
                .font(.system(size: PaletteEmojiSize))
                .padding(.horizontal)
                .scrollIndicators(.hidden)
        }
    }
    
    private var documentBody: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                documentContents(in: geometry)
                    .scaleEffect(zoom * gestureZoom )
                    .offset(pan)
            }
            .gesture(zoomGesture)
            .dropDestination(for: Sturldata.self) { sturlDatas, location in
                return drop(sturlDatas, at: location, in: geometry)
            }
        }
    }
    
    @State private var zoom: CGFloat = 1
    @State private var pan: CGOffset = .zero
    
    @GestureState private var gestureZoom: CGFloat = 1
    
    private var zoomGesture: some Gesture {
        MagnificationGesture()
            .updating($gestureZoom) { inMotionScale, gestureZoom, _ in
                gestureZoom = inMotionScale
            }
            .onEnded { endingPinchScale in
                zoom *= endingPinchScale
            }
    }
    
    @ViewBuilder
    private func documentContents(in geometry: GeometryProxy) -> some View {
        AsyncImage(url: document.background)
            .position(Emoji.Position.zero.in(geometry))
        // emojis
        ForEach(document.emojis) { emoji in
            Text(emoji.string)
                .font(emoji.font)
                .position(emoji.position.in(geometry))
        }
    }
    
    private func drop(_ sturlDatas: [Sturldata], at location: CGPoint, in geometry: GeometryProxy) -> Bool {
        for sturlData in sturlDatas {
            switch (sturlData) {
            case .url(let url):
                document.setBackground(url)
                return true
            case .string(let emoji):
                document.addEmoji(
                    emoji,
                    at: emojiPosition(at: location, in: geometry),
                    size: PaletteEmojiSize
                )
                return true
            default:
                break
            }
        }
        return false
    }
    
    private func emojiPosition(at location: CGPoint, in geometry: GeometryProxy) -> Emoji.Position {
        let center = geometry.frame(in: .local).center
        return Emoji.Position(
            x: Int(location.x - center.x),
            y: Int(-(location.y - center.y))
        )
    }
}

struct ScrollingEmojis: View {
    let emojis: [String]
    
    init(_ emojis: String) {
        self.emojis = emojis.uniqued.map(String.init)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji)
                        .draggable(emoji)
                }
            }
        }
    }
}

#Preview {
    EmojiArtDocumentView(document: EmojiArtDocument())
} 
