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
    func fetchItems() -> BrowseModel
}

class BrowseViewModel: BrowseViewModelProtocol {
    
    @Published var isDetailViewPresented: Bool = false
    let constants: BrowseConstants = BrowseConstants()
    
    func fetchItems() -> BrowseModel {
        return BrowseModel(
            news: newsArray,
            items: sneakersArray)
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
}


