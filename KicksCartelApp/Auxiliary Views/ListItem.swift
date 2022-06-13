//
//  SwiftUIView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 19/03/22.
//

import SwiftUI

struct ListItemView: View {
    
    var sneakerInfo: SneakerModel
    
    @State var isPressed = false
    
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
            Text(sneakerInfo.completeName)
                .font(.system(size: 15))
                .foregroundColor(.white)
                .fontWeight(.black)
            
            Spacer()
            
            HStack {
                Text(sneakerInfo.price)
                    .font(.system(.body))
                    .foregroundColor(.secondary)
                    .fontWeight(.black)
                Spacer()
                LikeButton(isPressed: isPressed)
            }
        }
        .padding(10)

    }
    
    var imageSet: some View {
        ZStack {
            gradientBackground
            Image(sneakerInfo.sneakerImage)
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

struct LikeButton : View {
    var darkMode: Bool? = false
    @State var isPressed = false
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .opacity(isPressed ? 1 : 0)
                .scaleEffect(isPressed ? 1.0 : 0.1)
                .animation(.linear)
            Image(systemName: "heart")
        }.font(.system(size: 20))
            .onTapGesture {
                self.isPressed.toggle()
        }
        .foregroundColor(isPressed ? .red : getForegroundColor())
    }
    
    private func getForegroundColor() -> Color {
        if darkMode ?? false {
            return .white
        } else {
            return .black
        }
    }
}


struct DeleteButton : View {
    @State var isPressed = false
    var body: some View {
        ZStack {
            Image(systemName: "trash.fill")
                .opacity(isPressed ? 1 : 0)
                .scaleEffect(isPressed ? 1.0 : 0.1)
                .animation(.linear)
            Image(systemName: "trash")
        }.font(.system(size: 20))
            .onTapGesture {
                self.isPressed.toggle()
        }
        .foregroundColor(isPressed ? .red : .black)
    }
}
