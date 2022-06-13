//
//  ContentView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 11/03/22.
//

import SwiftUI

struct BrowseView: View {
    
    var browseViewModel: BrowseViewModelProtocol
    

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
                        ForEach(browseViewModel.fetchItems().items) { sneakerInfo in
                            ListItemView(sneakerInfo: sneakerInfo)
                                .frame(width: browseViewModel.constants.secondaryCardWidth, height: browseViewModel.constants.secondaryCardHeight, alignment: .center)
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
        .navigationBarHidden(true)
        .padding(.leading, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(browseViewModel: BrowseViewModel())
    }
}
