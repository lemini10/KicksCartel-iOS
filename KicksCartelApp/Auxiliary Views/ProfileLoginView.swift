//
//  ProfileLoginView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 20/06/22.
//

import SwiftUI
import Combine

struct ProfileLoginView: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var selectedIndex: Int
    
    var doLogin: (()->Void)
    var doRegister: (()->Void)
    
    var body: some View {
        ZStack {
            gradientBackground
            textfieldsView
        }
    }
    
    var gradientBackground: some View {
        Color.clear
            .background(LinearGradient(
                gradient: Gradient(colors: [.black, .white]),
                startPoint: .top,
                endPoint: .bottom))
    }
    
    var textfieldsView: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 100)
            VStack {
                segmentedController
                TextField("Email", text: $email)
                    .padding()
                TextField("Password", text: $password)
                    .padding()
                if selectedIndex == 0 {
                    Button("Login") {
                        doLogin()
                    }
                } else {
                    Button("Register") {
                        doRegister()
                    }
                }

            }
            .frame(height: 250)
            .background(Color.white)
            .padding()
            Spacer()
        }
    }
    
    var segmentedController: some View {
        Picker("", selection: $selectedIndex) {
            Text("Login").tag(0)
            Text("Register").tag(1)
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
}
