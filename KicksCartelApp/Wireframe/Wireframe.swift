//
//  Wireframe.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import Foundation
import SwiftUI

class Wireframe {
    static func createBrowseView() -> some View {
        let viewModel: BrowseViewModel = BrowseViewModel()
        let view: BrowseView = BrowseView(browseViewModel: viewModel)
        return view
    }
    
    static func createFavoritesView() -> some View {
        let viewModel: FavoritesViewModel = FavoritesViewModel()
        let view: FavoritesView = FavoritesView(viewModel: viewModel)
        return view
    }
    
    static func createSearchView() -> some View {
        let viewModel: BrowseViewModel = BrowseViewModel()
        let view: SearchView = SearchView()
        return view
    }
    
    static func createCartView() -> some View {
        let viewModel: CartViewModel = CartViewModel()
        let view: CartView = CartView(viewModel: viewModel)
        return view
    }
    
    static func createProfileView() -> some View {
        let viewModel: ProfileViewModel = ProfileViewModel()
        let view: ProfileView = ProfileView(viewModel: viewModel)
        return view
    }
}
