//
//  ContentView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 11/03/22.
//

import SwiftUI

struct BrowseView: View {
    
    var principalCardHeight: CGFloat = 250
    var principalCardWidth: CGFloat = 300
    
    var secondaryCardHeight: CGFloat = 250
    var secondaryCardWidth: CGFloat = 150
    
    var sneakersArray: [SneakerInfo] = [
        SneakerInfo(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180"),
        SneakerInfo(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180"),
        SneakerInfo(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180"),
        SneakerInfo(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180"),
        SneakerInfo(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180")]
    
    var newsArray: [NewsInfo] = [
        NewsInfo(id: UUID(), title: "Jordan Chicago Restocking 2022", subtitle: "Nike", image: "Guava"),
        NewsInfo(id: UUID(), title: "Jordan Chicago Restocking 2022", subtitle: "Nike", image: "Guava"),
        NewsInfo(id: UUID(), title: "Jordan Chicago Restocking 2022", subtitle: "Nike", image: "Guava"),
        NewsInfo(id: UUID(), title: "Jordan Chicago Restocking 2022", subtitle: "Nike", image: "Guava"),
        NewsInfo(id: UUID(), title: "Jordan Chicago Restocking 2022", subtitle: "Nike", image: "Guava")]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Browse")
                    .font(.system(.largeTitle,design: .monospaced))
                    .fontWeight(.black)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(newsArray) { newsInfo in
                            NewsCard(newsInfo: newsInfo)
                                .frame(width: principalCardWidth, height: principalCardHeight, alignment: .center)
                        }
                    }
                }
                
                Text("Categories")
                    .font(.system(.largeTitle,design: .monospaced))
                    .fontWeight(.black)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(sneakersArray) { sneakerInfo in
                            ListItemView(sneakerInfo: sneakerInfo)
                                .frame(width: secondaryCardWidth, height: secondaryCardHeight, alignment: .center)
                        }
                    }
                }
                
                Text("Items")
                    .font(.system(.largeTitle,design: .monospaced))
                    .fontWeight(.black)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(sneakersArray) { sneakerInfo in
                            CartItemView(sneakerInfo: sneakerInfo)
                                .frame(width: 350, height: 150, alignment: .center)
                                .onTapGesture {
                                }
                        }
                    }
                }
            }
        }
        .padding(.leading, 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
