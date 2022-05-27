//
//  DetailView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 26/03/22.
//

import SwiftUI

struct DetailView: View {
    
    var imageSet: [ShoeDetail]

    var body: some View {
        VStack {
            imageCarrousel
            textViews
        }
    }
    var imageCarrousel: some View {
        VStack {
            ZStack {
                Color.s800
                    .cornerRadius(15, corners: [.bottomRight,.bottomLeft])
                imageShowdown
            }
            Color.white
        }
    }
    
    var textViews: some View {
        
        VStack {
            Text("Jordan")
                .font(.system(.largeTitle,design: .monospaced))
                .fontWeight(.black)
            .padding(.horizontal)
            
            Text("Jordan 4 Guava Ice")
                .fontWeight(.black)
                .font(.system(size: 50))
                .padding(.horizontal)
            
            Text("""
                Guava Ice delivers a vibrant take on the classic silhouette. The upper combines soft pink suede with breathable mesh on the collar and toe box. Semi translucent TU wings provide structural support, taking cues from an original Tinker Hatfield sketch.
                """)
                .fontWeight(.light)
                .font(.system(size: 15))
                .padding(.horizontal)
            Spacer()
        }
    }
    
    var imageShowdown: some View {
            TabView {
                ForEach(imageSet, id: \.self) { imageSelected in
                    Image(imageSelected.imageName)
                        .resizable()
                        .scaledToFit()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .offset(x: 0, y: 100)
    }

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imageSet: [
            ShoeDetail(imageName: "Guava"),
            ShoeDetail(imageName: "Guava"),
            ShoeDetail(imageName: "Guava")])
    }
}
