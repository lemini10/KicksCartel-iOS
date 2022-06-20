//
//  ViewModifiers.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 13/06/22.
//

import Foundation
import SwiftUI

struct CardStyle: ViewModifier {
    var color: Color
    var lineWidth: CGFloat
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .cornerRadius(cornerRadius)
            .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(color, lineWidth: lineWidth))
    }
}

extension View {
    func cardStyle(color: Color = Color.grayBackgrounds,
                   lineWidth: CGFloat = 3.0,
                   cornerRadius: CGFloat = 15.0) -> some View {
        modifier(CardStyle(color: color, lineWidth: lineWidth, cornerRadius: cornerRadius))
    }
}
