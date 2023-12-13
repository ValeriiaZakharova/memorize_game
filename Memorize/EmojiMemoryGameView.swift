//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 24.07.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUP {
                Rectangle().opacity(0)
            } else {
                Cardview(card: card)
                    .padding(4)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.green)
        .padding(.horizontal)
        
        Spacer(minLength: 30)
        Button("Shuffle") {
            game.shuffle()
        }
    }
}


struct Cardview: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack(alignment: .center) {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUP {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .padding(DrawingConstants.circlePadding)
                        .opacity(DrawingConstants.circleOpacity)
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
      
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 15
        static let lineWidth: CGFloat = 2
        static let fontScale: CGFloat = 0.7
        static let circlePadding: CGFloat = 5
        static let circleOpacity: CGFloat = 0.5
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.dark)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
    }
}
