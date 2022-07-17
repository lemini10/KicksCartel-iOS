//
//  CheckoutView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 16/07/22.
//

import SwiftUI

struct CheckoutView: View {
    
    var model: CardModel
    
    var body: some View {
        VStack {
            ZStack {
                gradientBackground
            }
            
        }
    }
    
    var gradientBackground: some View {
        Color.clear
            .background(
                LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom)
            )
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(model: CardModel(type: .Credit, name: "Luis Lemini", maskedNumbers: "**** **** **** 0000"))
    }
}

struct CardView: View {
    var model: CardModel
    var body: some View {
        VStack {
            Text(model.type.rawValue)
            Text(model.name)
            Text(model.maskedNumbers)
        }
    }
}

struct CardModel {
    var type: CardType
    var name: String
    var maskedNumbers: String
}

enum CardType: String {
    case Credit
    case Debit
}
