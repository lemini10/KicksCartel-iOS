//
//  ContentView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 11/03/22.
//

import SwiftUI
import Combine

struct BrowseView: View {
    
    @ObservedObject var browseViewModel: BrowseViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Browse")
                    .font(.system(.largeTitle,design: .monospaced))
                    .fontWeight(.black)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(browseViewModel.fetchItems().news) { newsInfo in
                            NewsCard(newsInfo: newsInfo)
                                .frame(width: browseViewModel.constants.principalCardWidth, height: browseViewModel.constants.principalCardHeight, alignment: .center)
                        }
                    }
                }
                
                Text("Categories")
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
                
                Text("Items")
                    .font(.system(.largeTitle,design: .monospaced))
                    .fontWeight(.black)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(browseViewModel.fetchItems().items) { sneakerInfo in
                            CartItemView(sneakerInfo: sneakerInfo)
                                .frame(width: 350, height: 150, alignment: .center)
                                .onTapGesture {
                                }
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            browseViewModel.onAppear()
        })
        .navigationBarHidden(true)
        .padding(.leading, 20)
    }
}
