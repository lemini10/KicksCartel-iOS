//
//  FavoritesViewModel.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import Foundation
import Combine

class FavoritesViewModel: ObservableObject {
    
    @Published var isDetailViewPresented: Bool = false
    @Published var fetchedSneakers: [FetchedSneaker] = []
    @Published var fetchedNews: [FetchedNews] = []
    
    var cancellables: Set<AnyCancellable> = Set()
    let constants: BrowseConstants = BrowseConstants()
    
    func onAppear() {
        fetchFavorites()
    }
    
    private func fetchFavorites() {
        RemoteDataManager.shared.fetchFavorites().sink { completion in
            switch completion {
            case .finished:
                print("Fetched favorites successfully")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { fetchedSneakersArray in
            self.fetchedSneakers = fetchedSneakersArray
        }
        .store(in: &cancellables)
    }
    
    func deleteItem(_ item: FetchedSneaker) {
        RemoteDataManager.shared.deleteFavorites(item: item, completion: {
            fetchFavorites()
        })
    }
}
