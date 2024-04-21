//
//  CardView.swift
//  Memorize
//
//  Created by Taylor Zeller on 4/19/24.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(270))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(contentMode: .fit)
                    .padding(Constants.Pie.inset)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.spin(duration: 1), value: card.isMatched)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 3
        static let inset: CGFloat = 5
        
        struct FontSize {
            static let smallest: CGFloat = 10
            static let largest: CGFloat = 200
            static let scaleFactor = smallest / largest
        }
        
        struct Pie {
            static let opacity: CGFloat = 0.65
            static let inset: CGFloat = 5
        }
    }
}

extension Animation {
    static func spin(duration Time: CGFloat) -> Animation {
        .linear(duration: Time).repeatForever(autoreverses: false)
    }
}

#Preview {
    VStack {
        HStack {
            CardView(MemoryGame<String>.Card(content: "🧀", id: "1a"))
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "🧀", id: "1a"))
        }
        HStack {
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "🧀", id: "1a"))
            CardView(MemoryGame<String>.Card(isMatched: true, content: "🧀", id: "1a"))
        }
    }
        .padding()
        .foregroundColor(.orange)
}
