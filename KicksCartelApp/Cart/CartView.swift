//
//  CartView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import SwiftUI
import Combine

struct CartView: View {
    
    @ObservedObject var viewModel: CartViewModel
    var body: some View {
        ScrollView {
            VStack {
                CartItemView(sneakerInfo: FetchedSneaker(brand: "", sneakerImage: "", completeName: "", price: ""), completion: {})
                
                Button("Checkout") {
                    viewModel.continueButtonPressed()
                }
            }
        }
        .padding()
    }
}
