//
//  CartItemView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 19/03/22.
//

import SwiftUI

struct CartItemView: View {
    
    var sneakerInfo: FetchedSneaker
    let completion: (()->Void)?

    var body: some View {
        HStack {
            imageSet
                .cornerRadius(15)
                .padding()
            infoView
        }
        .frame(height:140)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,
                              opacity: 0.3), lineWidth: 3))
    }
    
    //MARK:- Auxiliary Views
    
    var gradientBackground: some View {
        Color.clear
            .background(LinearGradient(
                gradient: Gradient(colors: [.black, .white]),
                startPoint: .top,
                endPoint: .bottom))
    }
    
    var infoView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(sneakerInfo.brand)
                    .font(.system(.body))
                    .foregroundColor(.secondary)
                    .fontWeight(.black)
                Text(sneakerInfo.completeName)
                    .font(.system(.body,design: .rounded))
                    .fontWeight(.black)
                    .lineLimit(2)
                
                HStack {
                    Text("10.5")
                        .font(.system(.body))
                        .fontWeight(.black)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    Spacer()
                    DeleteButton(completion: {
                        completion?()
                        
                    })
                        .padding(.trailing, 10)
                    
                }
                
            }
            Spacer()
        }
    }
    
    var imageSet: some View {
        ZStack {
            gradientBackground
            Image(sneakerInfo.sneakerImage)
                .resizable()
                .scaledToFit()
        }
    }
}
