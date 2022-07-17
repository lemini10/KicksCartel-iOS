//
//  CartView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import SwiftUI
import Combine

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel

    var body: some View {
        ZStack {
            if viewModel.fetchedSneakers.isEmpty {
                emptyViewSkeleton
            } else {
                favoritesView
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
    
    var emptyViewSkeleton: some View {
        VStack {
            Image(systemName: "star")
            Text("Add items to your wish list")
        }
    }
    
    var favoritesView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach($viewModel.fetchedSneakers) { sneakerInfo in
                    CartItemView(sneakerInfo: sneakerInfo.wrappedValue, completion: {
                        viewModel.deleteItem(sneakerInfo.wrappedValue)
                    })
                        .padding(.horizontal)
                }
                Button("Checkout") {
                    viewModel.continueButtonPressed()
                }
                .padding(.top)
            }
        }
        .padding(.top, 25)
    }
}
