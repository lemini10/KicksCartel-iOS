//
//  CategoriesCard.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 10/07/22.
//

import SwiftUI

struct CategoriesCard: View {
    
    var categorie: ApparealCategorie
    
    var body: some View {
        ZStack {
            imageSet
            infoView
            
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(15)
        .overlay(
        RoundedRectangle(cornerRadius: 15)
        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,
        opacity: 0.3), lineWidth: 3))
    }
    
    var infoView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(categorie.completeName)
                .font(.system(size: 15))
                .foregroundColor(.white)
                .fontWeight(.black)
            
            Spacer()
        }
        .padding(10)

    }
    
    var imageSet: some View {
        ZStack {
            gradientBackground
            Image(categorie.image)
                .resizable()
                .scaledToFit()
        }
    }
    
    var gradientBackground: some View {
        Color.clear
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.black, .white]),
                    startPoint: .top,
                    endPoint: .bottom))
    }
}

enum ApparealCategorie: Identifiable {
    var id: String { self.completeName}
    
    case sneakers
    case slides
    case beanies
    case shirts
    case collectibles
    
    var completeName: String {
        switch self {
        case .sneakers:
            return "Sneakers"
        case .slides:
            return  "Slides"
        case .beanies:
            return "Beanies"
        case .shirts:
            return "Shirts"
        case .collectibles:
            return "Collectibles"
        }
    }
    
    var image: String {
        switch self {
        case .sneakers:
            return "Guava"
        case .slides:
            return  "Guava"
        case .beanies:
            return "Guava"
        case .shirts:
            return "Guava"
        case .collectibles:
            return "Guava"
        }
    }
}
