//
//  CheckoutView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 16/07/22.
//

import SwiftUI

struct CheckoutView: View {
    
    var model: CardModel
    
    let width: CGFloat = UIScreen.main.bounds.width
    let height: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            ZStack {
                gradientBackground
                CardView(model: model)
            }
            .frame(height: height * 0.4)
            Spacer()
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
    
    let width: CGFloat = UIScreen.main.bounds.width
    let height: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(model.type.rawValue)
                    .padding(.leading,25)
                    .padding(.top, 25)
                Spacer()
            }
            Spacer()
            Text(model.name)
                .padding(.leading,25)
            Text(model.maskedNumbers)
                .padding(.leading,25)
                .padding(.bottom, 25)
        }
        .frame(width: width * 0.8, height: height * 0.2)
        .background(Color.white)
        .cornerRadius(25)
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
