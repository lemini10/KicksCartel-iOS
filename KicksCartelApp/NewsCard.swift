//
//  NewsCard.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 18/03/22.
//

import SwiftUI

struct NewsCard: View {
    var newsInfo: NewsInfo
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            imageSet
            infoView
                .padding(10)
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(15)
        .overlay(
        RoundedRectangle(cornerRadius: 15)
        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,
        opacity: 0.3), lineWidth: 3)
                )
        
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
                Text(newsInfo.subtitle)
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

struct NewsCard_Previews: PreviewProvider {
    
    
    static var previews: some View {
        NewsCard(newsInfo: NewsInfo(id: UUID(), title: "Jordan Chicago Restocking 2022", subtitle: "Nike", image: "Guava"))
            .padding()
            .frame(width: .infinity, height: 400, alignment: .center)
    }
}

extension Color {
    public static var purpleGradient: Color {
        return Color(UIColor(red: 54/255, green: 0/255, blue: 51/255, alpha: 1.0))
    }
    
    public static var blueGradient: Color {
        return Color(UIColor(red: 11/255, green: 135/255, blue: 147/255, alpha: 1.0))
    }
}

struct SneakerInfo: Identifiable{
    var id: UUID    
    var brand: String
    var sneakerImage: String
    var completeName: String
    var size: String
    var price: String
}

struct NewsInfo: Identifiable{
    var id: UUID
    var title: String
    var subtitle: String
    var image: String
}
