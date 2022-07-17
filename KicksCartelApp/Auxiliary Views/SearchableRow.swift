//
//  SearchableRow.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 16/07/22.
//

import SwiftUI

struct SearchableRow: View {
    
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
                    .lineLimit(3)
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
