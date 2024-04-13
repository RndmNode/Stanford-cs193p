//
//  ContentView.swift
//  Memorize
//
//  Created by Taylor Zeller on 4/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.black)
                base.stroke(style: /*@START_MENU_TOKEN@*/StrokeStyle()/*@END_MENU_TOKEN@*/)
                Text("🤬").font(.largeTitle)
            } else {
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
