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
        let viewModel: BrowseViewModelProtocol = BrowseViewModel()
        let view: BrowseView = BrowseView(browseViewModel: viewModel)
        return view
    }
    
    static func createFavoritesView() -> some View {
        let viewModel: BrowseViewModelProtocol = BrowseViewModel()
        let view: FavoritesView = FavoritesView()
        return view
    }
    
    static func createSearchView() -> some View {
        let viewModel: BrowseViewModelProtocol = BrowseViewModel()
        let view: SearchView = SearchView()
        return view
    }
    
    static func createCartView() -> some View {
        let viewModel: BrowseViewModelProtocol = BrowseViewModel()
        let view: CartView = CartView()
        return view
    }
    
    static func createProfileView() -> some View {
        let viewModel: BrowseViewModelProtocol = BrowseViewModel()
        let view: ProfileView = ProfileView()
        return view
    }
}
