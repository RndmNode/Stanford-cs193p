//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Taylor Matzeller on 4/12/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: game.cards)
            }
            Button("Shuffle"){
                game.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(game.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.orange)
    }
    
}

#Preview {
    EmojiMemoryGameView(game: EmojiMemoryGame())
}
