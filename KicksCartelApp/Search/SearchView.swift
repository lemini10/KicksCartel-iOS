//
//  SearchView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel = SearchViewModel()
    var body: some View {
        ScrollView {
            VStack {
                searchBar
                    .foregroundColor(.s800)
                    .padding()
            }
        }
    }
    
    var searchBar: some View {
            HStack(spacing: 20) {
                Image(systemName: "magnifyingglass")
                    .padding()
                TextField("Search for products", text: $viewModel.searchText)
                    .padding(.trailing,15)
            }
            .cardStyle()
    }
}
