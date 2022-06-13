//
//  FavoritesView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        ScrollView {
            VStack {
                CartItemView(sneakerInfo: SneakerModel(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan 4 Guava Ice", size: "10.5", price: "180USD"))
            }
        }
        .padding()
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
