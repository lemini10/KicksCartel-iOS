//
//  CategoriesCard.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 10/07/22.
//

import SwiftUI

struct BrandCard: View {
    
    var brand: ApparealsBrands
    
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
            Text(brand.completeName)
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
            Image(brand.image)
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

enum ApparealsBrands: Identifiable {
    var id: String { self.completeName}
    
    case nike
    case jordan
    case adidas
    case yeezy
    case newBalance
    case others
    
    var completeName: String {
        switch self {
        case .nike:
            return "Nike"
        case .jordan:
            return "Jordan"
        case .adidas:
            return "Adidas"
        case .yeezy:
            return "Yeezy"
        case .newBalance:
            return "New Balance"
        case .others:
            return "Otros"
        }
    }
    
    var image: String {
        switch self {
        case .nike:
            return "Guava"
        case .jordan:
            return "Guava"
        case .adidas:
            return "Guava"
        case .yeezy:
            return "Guava"
        case .newBalance:
            return "Guava"
        case .others:
            return "Guava"
        }
    }
}
