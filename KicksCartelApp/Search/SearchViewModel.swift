//
//  SearchViewModel.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import Foundation
import Combine

protocol SearchViewModelProtocol: ObservableObject {
    var searchText: String { get set}
}

class SearchViewModel: SearchViewModelProtocol {
    @Published var searchText: String = ""
    @Published var fetchedSneakers: [FetchedSneaker] = []
    var cancellables: Set<AnyCancellable> = Set()

    func fetchSneakers() {
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
}
