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
                Text(card.content)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(DrawingConstants.circlePadding)
                    .opacity(DrawingConstants.circleOpacity)
            }
            .cardify(isFaceUp: card.isFaceUP)
        })
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
      
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 30
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
