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
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                base.fill(.black)
                base.stroke(style: StrokeStyle(lineWidth: Constants.lineWidth))
                Pie(endAngle: .degrees(270))
                    .opacity(Constants.Pie.opacity)
                    .overlay(
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
                            .multilineTextAlignment(.center)
                            .aspectRatio(contentMode: .fit)
                            .padding(Constants.Pie.inset)
                    )
                    .padding(Constants.inset)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
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
