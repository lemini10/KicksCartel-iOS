//
//  DetailShowView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 25/03/22.
//

import SwiftUI

struct DetailShowView: View {
    
    var shoeDetails: ShoeDetail

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                gradientBackground
                    .padding(.bottom,80)
                Text(shoeDetails.brand)
                    .font(.system(.largeTitle,design: .monospaced))
                    .fontWeight(.black)
                    .padding(.horizontal)

                Text(shoeDetails.name)
                    .fontWeight(.black)
                    .font(.system(size: 50))
                    .padding(.horizontal)
                
                Text(shoeDetails.description)
                    .fontWeight(.light)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Spacer()

                HStack {
                    LikeButton(darkMode: true)
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color.s800)
                        .cornerRadius(15)
                    Spacer()
                    Button("Add to cart") {
                    }
                    .frame(width: 250, height: 50, alignment: .center)
                    .background(Color.s800)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    
                }
                .padding(.horizontal,40)
                .padding(.top)
                Spacer()
            }
            imageShowdown
                .frame(height: UIScreen.main.bounds.size.height * 0.4)
                .offset(x: 0, y: -300)
        }
        
    }
    
    var imageShowdown: some View {
            TabView {
                ForEach(shoeDetails.imageSet, id: \.self) { imageSelected in
                    Image(imageSelected)
                        .resizable()
                        .scaledToFit()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .offset(x: 0, y: 100)
    }
    
    var colorView: some View {
            Color.black
                .cornerRadius(20, corners: [.bottomRight,.bottomLeft])
            .frame(height: UIScreen.main.bounds.size.height * 0.3)
    }
    
    var gradientBackground: some View {
        Color.clear
            .background(
                    LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom)
                )
    }
    
    var imageView: some View {
        VStack {
            TabView {
                ForEach(shoeDetails.imageSet, id: \.self) { imageSelected in
                    Image(imageSelected)
                        .resizable()
                        .scaledToFit()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: UIScreen.main.bounds.size.height * 0.5)
            Spacer()
        }
    }
}

struct DetailShowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailShowView(shoeDetails:
            ShoeDetail(
                imageSet: ["Guava", "Guava","Guava"],
                brand: "Jordan",
                name: "Jordan 4 Guava Ice",
                description: """
                    Guava Ice delivers a vibrant take on the classic silhouette. The upper combines soft pink suede with breathable mesh on the collar and toe box. Semi translucent TU wings provide structural support, taking cues from an original Tinker Hatfield sketch.
                    """,
            price: 180.00,
            shoppingStatus: .liked))
    }
}

struct ShoeDetail: Hashable {
    var imageSet: [String]
    var brand: String
    var name: String
    var description: String
    var price: Double
    var shoppingStatus: ShoppingStatus
}

enum ShoppingStatus {
    case inCart
    case liked
    case empty
}
