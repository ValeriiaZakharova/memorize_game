//
//  Cardify.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 13.12.2023.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUP: Bool
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUP {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill()
            }
            content
                .opacity(isFaceUP ? 1: 0)
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 15
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUP: isFaceUp))
    }
}
