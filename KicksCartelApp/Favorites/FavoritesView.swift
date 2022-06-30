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
                CartItemView(sneakerInfo: CONSTANTS.sneakerModel)
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
