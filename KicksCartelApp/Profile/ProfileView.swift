//
//  ProfileView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import SwiftUI

struct ProfileView: View {
    
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height

    var body: some View {
        VStack {
            profilePic
            ProfileRow(desiredRow: .Profile)
                .cardStyle()
                .padding(.horizontal)
            ProfileRow(desiredRow: .Buying)
                .cardStyle()
                .padding(.horizontal)
            ProfileRow(desiredRow: .Shipping)
                .cardStyle()
                .padding(.horizontal)
            ProfileRow(desiredRow: .Payments)
                .cardStyle()
                .padding(.horizontal)
            ProfileRow(desiredRow: .Answers)
                .cardStyle()
                .padding(.horizontal)
        }
    }
    
    var profilePic: some View {
        Image("Guava")
            .resizable()
            .background(
                    LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom)
                )
            .cornerRadius(15)
            .frame(height: screenHeight * 0.35)
            .padding(.horizontal)
    }
}
