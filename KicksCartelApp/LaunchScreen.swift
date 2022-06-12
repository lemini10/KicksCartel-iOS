//
//  LaunchScreen.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 28/05/22.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isReadyToNavigate = false
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: Wireframe.createBrowseView(),
                               isActive: $isReadyToNavigate) { EmptyView() }
                Color.black
                Image("Logo")
                    .resizable()
                    .scaledToFit()
            }
            .ignoresSafeArea()
            .task {
                try? await Task.sleep(nanoseconds: 2_500_000_000)
                isReadyToNavigate = true
        }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
