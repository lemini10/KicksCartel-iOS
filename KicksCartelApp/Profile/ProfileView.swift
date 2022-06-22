//
//  ProfileView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import SwiftUI

struct ProfileView<ViewModel: ProfileViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            if viewModel.isUserRegistered {
                loggedView
            } else {
                loginView
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
    
    var loginView: some View {
        ProfileLoginView(
            email: $viewModel.email,
            password: $viewModel.password,
            selectedIndex: $viewModel.selectedIndex,
            doLogin: { viewModel.doLogin() },
            doRegister: { viewModel.doRegister()})
    }
    
    var loggedView: some View {
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
            Button("Cerrar sesión") {
                viewModel.doLogOut()
            }
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
