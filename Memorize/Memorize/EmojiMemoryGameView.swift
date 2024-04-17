//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Taylor Matzeller on 4/12/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var game: EmojiMemoryGame = EmojiMemoryGame()
    
    let emojis = ["👺","🤡","👽","🤖","👻","☠️","👑","💍","🦆","👀","🧀","🤍"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(game.cards.indices, id: \.self) { index in
                CardView(game.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.black)
                base.stroke(style: StrokeStyle(lineWidth: 3.0))
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
