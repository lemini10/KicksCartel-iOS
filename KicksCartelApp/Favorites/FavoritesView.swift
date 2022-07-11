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
                CartItemView(sneakerInfo: FetchedSneaker(brand: "", sneakerImage: "", completeName: "", price: ""))
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
