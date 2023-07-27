//
//  ContentView.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 24.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚌", "✈️", "🚘", "🚇", "🚞", "🚜", "🚓", "🚑", "🏍️", "🚢", "🚁", "⛵️", "🚀", "🛰️", "💺", "⚓️", "🛺", "🛴", "🚤", "🚲", "🛞", "🚒", "🛟", "🛶", "🚨", "🛻"]
    @State var emojiCount = 20
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        Cardview(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.purple)
        }
        .padding(.horizontal)
    }
}

struct Cardview: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 15.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
