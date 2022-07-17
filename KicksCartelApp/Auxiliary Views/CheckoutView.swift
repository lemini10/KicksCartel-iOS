//
//  CheckoutView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 16/07/22.
//

import SwiftUI

struct CheckoutView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: CheckoutViewModel

    let width: CGFloat = UIScreen.main.bounds.width
    let height: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            gradientBackground
            VStack {
                navigationView
                    .padding(.vertical,30)
                HStack {
                    Text("Checkout")
                        .font(.system(.largeTitle,design: .monospaced))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                    Spacer()
                }
                CardView(model: viewModel.model)
                HStack {
                    Text("Items")
                        .font(.system(.largeTitle,design: .monospaced))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                    Spacer()
                }
                List {
                    ForEach(viewModel.items) { item in
                        HStack(alignment: .center) {
                            Image(item.sneakerImage)
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(spacing: 5) {
                                HStack {
                                    Text(item.brand)
                                    Spacer()
                                }
                                Text(item.completeName)
                            }
                            VStack {
                                Text(item.price)
                                Spacer()
                            }
                        }
                    }
                }
                .frame(height: height * 0.45)
                Button("Pay", action: {
                    
                })
                Spacer()
            }
        }
    }
    
    var navigationView: some View {
        HStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top, 35)
                    .padding(.leading, 35)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .frame(height: height * 0.05)
    }
    
    var gradientBackground: some View {
        Color.clear
            .background(
                LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom)
            )
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
