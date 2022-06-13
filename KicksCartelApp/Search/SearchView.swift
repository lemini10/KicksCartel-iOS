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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct CardStyle: ViewModifier {
    var color: Color
    var lineWidth: CGFloat
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .cornerRadius(cornerRadius)
            .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(color, lineWidth: lineWidth))
    }
}

extension View {
    func cardStyle(color: Color = Color.grayBackgrounds,
                   lineWidth: CGFloat = 3.0,
                   cornerRadius: CGFloat = 15.0) -> some View {
        modifier(CardStyle(color: color, lineWidth: lineWidth, cornerRadius: cornerRadius))
    }
}
