//
//  NewsCard.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 18/03/22.
//

import SwiftUI

struct NewsCard: View {
    var newsInfo: NewsModel
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            imageSet
            infoView
                .padding(10)
        }
        .cardStyle()
        
    }
    
    //MARK:- Auxiliary Views
    
    var gradientBackground: some View {
        Color.clear
            .background(
                    LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom)
                )
    }
    
    var infoView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(newsInfo.details)
                    .font(.system(.body,design: .rounded))
                    .foregroundColor(.secondary)
                    .fontWeight(.black)
                Text(newsInfo.title)
                    .font(.system(.title2,design: .monospaced))
                    .fontWeight(.black)
                    .lineLimit(2)
            }
            Spacer()
        }
        
    }
    
    var imageSet: some View {
        ZStack {
            gradientBackground
            Image(newsInfo.image)
                .resizable()
                .scaledToFit()
        }
    }
}
