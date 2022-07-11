//
//  ContentView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 11/03/22.
//

import SwiftUI
import Combine

struct BrowseView: View {
    
    @StateObject var browseViewModel: BrowseViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                newsView
                categoriesView
                itemsView
                recentlyViewedItems
            }
        }
        .onAppear(perform: {
            browseViewModel.onAppear()
        })
        .navigationBarHidden(true)
        .padding(.leading, 20)
    }
    
    var newsView: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Browse")
                .font(.system(.largeTitle,design: .monospaced))
                .fontWeight(.black)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach($browseViewModel.fetchedNews) { newsInfo in
                        NewsCard(newsInfo: newsInfo.wrappedValue)
                            .frame(width: browseViewModel.constants.principalCardWidth, height: browseViewModel.constants.principalCardHeight, alignment: .center)
                    }
                }
            }
        }
    }
    
    
    var categoriesView: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Categories")
                .font(.system(.largeTitle,design: .monospaced))
                .fontWeight(.black)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(browseViewModel.constants.categoriesArray) { categorie in
                        CategoriesCard(categorie: categorie)
                            .frame(width: browseViewModel.constants.secondaryCardWidth, height: browseViewModel.constants.secondaryCardHeight, alignment: .center)
                            .onTapGesture(perform: {
                                browseViewModel.isDetailViewPresented = true
                            })
                            .fullScreenCover(isPresented: $browseViewModel.isDetailViewPresented) {
                                DetailShowView(viewModel: DetailViewModel(shoeDetails: CONSTANTS.sneakerModel))
                            }
                    }
                }
            }
        }
    }
    
    var itemsView: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Items one")
                .font(.system(.largeTitle,design: .monospaced))
                .fontWeight(.black)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach($browseViewModel.fetchedSneakers) { sneakerInfo in
                        ListItemView(sneakerInfo: sneakerInfo.wrappedValue)
                            .frame(width: browseViewModel.constants.secondaryCardWidth, height: browseViewModel.constants.secondaryCardHeight, alignment: .center)
                            .onTapGesture(perform: {
                                browseViewModel.isDetailViewPresented = true
                            })
                            .fullScreenCover(isPresented: $browseViewModel.isDetailViewPresented) {
                                DetailShowView(viewModel: DetailViewModel(shoeDetails: CONSTANTS.sneakerModel))
                            }
                    }
                }
            }
        }
    }
    
    var recentlyViewedItems: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Last Seen")
                .font(.system(.largeTitle,design: .monospaced))
                .fontWeight(.black)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach($browseViewModel.fetchedSneakers) { sneakerInfo in
                        CartItemView(sneakerInfo: sneakerInfo.wrappedValue)
                            .frame(width: 350, height: 150, alignment: .center)
                            .onTapGesture {
                            }
                    }
                }
            }

        }
    }
}
