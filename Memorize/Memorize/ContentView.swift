//
//  ContentView.swift
//  Memorize
//
//  Created by Taylor Matzeller on 4/12/24.
//

import SwiftUI

struct ContentView: View {
    var game: EmojiMemoryGame
    
    let emojis = ["👺","🤡","👽","🤖","👻","☠️","👑","💍","🦆","👀","🧀","🤍"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.black)
                base.stroke(style: StrokeStyle(lineWidth: 3.0))
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
