//
//  SearchView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            List {
                searchingView
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
                ForEach(searchResults) { result in
                    SearchableRow(sneakerInfo: result, completion: {}).searchCompletion(result.id)
                }
            }
            .navigationTitle("Search")
        }
        .onAppear {
            viewModel.fetchSneakers()
        }
    }
    
    var emptyViewSkeleton: some View {
        VStack {
            Image(systemName: "emptyViewSkeleton")
            Text("Search for models")
        }
    }
    
    
    var searchingView: some View {
        ForEach(searchResults) { selectedItem in
            NavigationLink(destination:DetailShowView(viewModel: DetailViewModel(shoeDetails: selectedItem)).navigationBarHidden(true)) {
                SearchableRow(sneakerInfo: selectedItem, completion: {
                })
            }
        }
    }
    
    var searchResults: [FetchedSneaker] {
        return viewModel.fetchedSneakers.filter { $0.id.contains(searchText) }
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
