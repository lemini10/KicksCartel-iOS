//
//  DetailShowView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 25/03/22.
//

import SwiftUI
import Combine

struct DetailShowView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ZStack {
            EmptyView()
                .onTapGesture {
                    viewModel.sizeSlideUpPresented = false
                }
            VStack {
                imageShowdown
                detailsView
            }
            SizesSlideUpModal(isOpen: $viewModel.sizeSlideUpPresented, data: ShoeSizes.man, selectedSizeAction: { selectedSize in
                viewModel.sizeSlideUpPresented = false
                var item = viewModel.shoeDetails
                item.size = selectedSize
                RemoteDataManager.shared.addToCart(item: item)
            })
            
        }
    }
    
    var detailsView: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(viewModel.shoeDetails.brand)
                    .font(.system(.largeTitle,design: .monospaced))
                    .fontWeight(.black)
                Text(viewModel.shoeDetails.completeName)
                    .fontWeight(.black)
                    .font(.system(size: 35))
                Text(viewModel.shoeDetails.description)
                    .fontWeight(.light)
                    .font(.system(size: 15))
            }
            .padding(.horizontal)
            buttonsView
        }
    }
    var imageShowdown: some View {
        ZStack {
            gradientBackground
                .padding(.bottom,80)
            VStack {
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: viewModel.constants.backwardsIcon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.top, 35)
                            .padding(.leading, 35)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        //TODO: - SHARE ITEM ACTION
                    } label: {
                        Image(systemName: viewModel.constants.shareIcon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.top, 35)
                            .padding(.trailing, 35)
                            .foregroundColor(.white)
                    }
                }
                TabView {
                    Image(viewModel.shoeDetails.imageSet.firstImage)
                        .resizable()
                        .scaledToFit()
                    Image(viewModel.shoeDetails.imageSet.secondImage)
                        .resizable()
                        .scaledToFit()
                    Image(viewModel.shoeDetails.imageSet.thirdImage)
                        .resizable()
                        .scaledToFit()
                    
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
    
    var buttonsView: some View {
        HStack {
            LikeButton(darkMode: true, addToFavoritesClosure: {
                RemoteDataManager.shared.addToFavorites(item: viewModel.shoeDetails)
            }, removeFromFavoritesClosure: {
                RemoteDataManager.shared.deleteFavorites(item: viewModel.shoeDetails, completion: {})
            })
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.s800)
                .cornerRadius(15)
            Spacer()
            Button("Add to cart") {
                viewModel.sizeSlideUpPresented = true
            }
            .frame(width: 250, height: 50, alignment: .center)
            .background(Color.s800)
            .foregroundColor(.white)
            .cornerRadius(15)
        }
        .padding(.horizontal,40)
        .padding(.top)
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
                Image(viewModel.shoeDetails.imageSet.firstImage)
                    .resizable()
                    .scaledToFit()
                Image(viewModel.shoeDetails.imageSet.secondImage)
                    .resizable()
                    .scaledToFit()
                Image(viewModel.shoeDetails.imageSet.thirdImage)
                    .resizable()
                    .scaledToFit()
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: UIScreen.main.bounds.size.height * 0.5)
            Spacer()
        }
    }
}
