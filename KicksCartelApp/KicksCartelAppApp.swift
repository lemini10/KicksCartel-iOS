//
//  KicksCartelAppApp.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 11/03/22.
//

import SwiftUI
import Combine

@main
struct KicksCartelAppApp: App {
    
    @StateObject var router: TabRouter = TabRouter()

    var body: some Scene {
        WindowGroup {
            TabView(selection: $router.currentScreen) {
                Wireframe.createBrowseView()
                    .environmentObject(router)
                    .tag(Screens.Browse)
                    .tabItem {
                        Label(Screens.Browse.rawValue, systemImage: Screens.Browse.tabImage)
                    }
                
                Wireframe.createFavoritesView()
                    .environmentObject(router)
                    .tag(Screens.Favorites)
                    .tabItem {
                        Label(Screens.Favorites.rawValue, systemImage: Screens.Favorites.tabImage)
                    }
                
                Wireframe.createSearchView()
                    .environmentObject(router)
                    .tag(Screens.Search)
                    .tabItem {
                        Label(Screens.Search.rawValue, systemImage: Screens.Search.tabImage)
                    }
                
                Wireframe.createCartView()
                    .environmentObject(router)
                    .tag(Screens.Cart)
                    .tabItem {
                        Label(Screens.Cart.rawValue, systemImage: Screens.Cart.tabImage)
                    }
                
                Wireframe.createProfileView()
                    .environmentObject(router)
                    .tag(Screens.Profile)
                    .tabItem {
                        Label(Screens.Profile.rawValue, systemImage: Screens.Profile.tabImage)
                    }
            }
        }
    }
}


class TabRouter: ObservableObject {
    @Published var currentScreen: Screens = .Browse
    
    func change(to screen: Screens) {
        self.currentScreen = screen
    }
}

enum Screens: String {
    case Browse
    case Favorites
    case Search
    case Cart
    case Profile
    
    var tabImage: String {
        switch self {
        case .Browse:
            return "house"
        case .Favorites:
            return "star"
        case .Search:
            return "magnifyingglass"
        case .Cart:
            return "cart"
        case .Profile:
            return "person"
        }
    }
}
