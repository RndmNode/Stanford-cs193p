//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Taylor Matzeller on 4/12/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    @ObservedObject var game: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .foregroundColor(.orange)
            }
            HStack {
                score
                Spacer()
                shuffle
            }
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score: \(game.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                game.shuffle()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrid(game.cards, aspectRatio: aspectRatio) { card in
                CardView(card)
                    .padding(4)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)
                        }
                    }
            }
        }
    
    private func scoreChanged(causedBy card: Card) -> Int {
        return 0
    }
    
}

#Preview {
    EmojiMemoryGameView(game: EmojiMemoryGame())
}
