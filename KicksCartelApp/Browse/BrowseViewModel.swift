//
//  BrowseViewModel.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 18/03/22.
//

import Foundation
import SwiftUI

protocol BrowseViewModelProtocol {
    var constants: BrowseConstants { get }
    func fetchItems() -> BrowseModel
}

class BrowseViewModel: BrowseViewModelProtocol {
    let constants: BrowseConstants = BrowseConstants()
    
    func fetchItems() -> BrowseModel {
        return BrowseModel(
            news: newsArray,
            items: sneakersArray)
    }
    
    var sneakersArray: [SneakerModel] = [
        SneakerModel(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180"),
        SneakerModel(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180"),
        SneakerModel(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180"),
        SneakerModel(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180"),
        SneakerModel(id: UUID(), brand: "Jordan", sneakerImage: "Guava", completeName: "Jordan IV x Union LA Guava Ice", size: "8.5 Mx", price: "$180")]
    
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
