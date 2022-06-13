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
}
