//
//  BrowseViewModel.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 18/03/22.
//

import Foundation
import SwiftUI
import Combine

protocol BrowseViewModelProtocol: ObservableObject {
    var constants: BrowseConstants { get }
    func onAppear()
}

class BrowseViewModel: BrowseViewModelProtocol {
    
    @Published var isDetailViewPresented: Bool = false
    @Published var fetchedSneakers: [FetchedSneaker] = []
    @Published var fetchedNews: [FetchedNews] = []
    
    var cancellables: Set<AnyCancellable> = Set()
    let constants: BrowseConstants = BrowseConstants()
    
    func onAppear() {
        fetchSneakers()
        fetchNews()
    }
    
    func fetchSneakers(){
        RemoteDataManager.shared.fetchSneakers().sink { completion in
            switch completion {
            case .finished:
                print("Fetched snekaers successfully")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { fetchedSneakersArray in
            self.fetchedSneakers = fetchedSneakersArray
        }
        .store(in: &cancellables)
    }
    
    func fetchNews() {
        RemoteDataManager.shared.fetchNews().sink { completion in
            switch completion {
            case .finished:
                print("Fetched news successfully")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { fetchedSneakersArray in
            self.fetchedNews = fetchedSneakersArray
        }
        .store(in: &cancellables)
    }

    var sneakersArray: [SneakerModel] = [
        CONSTANTS.sneakerModel,
        CONSTANTS.sneakerModel,
        CONSTANTS.sneakerModel,
        CONSTANTS.sneakerModel,
        CONSTANTS.sneakerModel,
        CONSTANTS.sneakerModel,
        CONSTANTS.sneakerModel,
    ]
    
    var newsArray: [NewsModel] = [NewsModel(image: "Guava", title: "Jordan Chicago Restocking 2022", details: "Nike"),
                                  NewsModel(image: "Guava", title: "Jordan Chicago Restocking 2022", details: "Nike"),
                                  NewsModel(image: "Guava", title: "Jordan Chicago Restocking 2022", details: "Nike"),
                                  NewsModel(image: "Guava", title: "Jordan Chicago Restocking 2022", details: "Nike"),
                                  NewsModel(image: "Guava", title: "Jordan Chicago Restocking 2022", details: "Nike")
    ]
}

class BrowseConstants {
    var principalCardHeight: CGFloat = 250
    var principalCardWidth: CGFloat = 300
    var secondaryCardHeight: CGFloat = 250
    var secondaryCardWidth: CGFloat = 150
    var categoriesArray: [ApparealCategorie] = [.sneakers, .slides, .beanies, .shirts, .collectibles]
}


