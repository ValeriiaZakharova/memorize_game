//
//  Cardify.swift
//  Memorize
//
//  Created by Valeriia Zakharova on 13.12.2023.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init(isFaceUP: Bool) {
        rotation = isFaceUP ? 0 : 180
    }
    
    //the date that needs to be animated
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double // in degrees
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill()
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(
            Angle.degrees(rotation), axis: (0, 1, 0)
        )
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
