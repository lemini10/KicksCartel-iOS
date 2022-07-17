//
//  CartViewModel.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import Foundation
import Combine

class CartViewModel: ObservableObject {
    
    @Published var isDetailViewPresented: Bool = false
    @Published var fetchedSneakers: [FetchedSneaker] = []
    
    var cancellables: Set<AnyCancellable> = Set()
    
    func onAppear() {
        fetchCartItems()
    }
    
    private func fetchCartItems() {
        RemoteDataManager.shared.fetchCartItems().sink { completion in
            switch completion {
            case .finished:
                print("Fetched cart successfully")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { fetchedSneakersArray in
            self.objectWillChange.send()
            self.fetchedSneakers = fetchedSneakersArray
        }
        .store(in: &cancellables)
    }
    
    func deleteItem(_ item: FetchedSneaker) {
        RemoteDataManager.shared.deleteCart(item: item, completion: {
            fetchCartItems()
        })
    }

    func continueButtonPressed() {
        
    }
}
