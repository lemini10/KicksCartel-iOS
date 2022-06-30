//
//  BrowseModel.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 06/06/22.
//

import Foundation

struct BrowseModel {
    var news: [NewsModel]
    var items: [SneakerModel]
}

struct NewsModel: Identifiable {
    var id: UUID = UUID()
    var image: String
    var title: String
    var details: String
}

struct SneakerModel: Identifiable {
    var id: UUID
    var brand: String
    var imageSet: [String]
    var sneakerImage: String
    var completeName: String
    var description: String
    var size: String
    var price: String
    var shoppingStatus: ShoppingStatus
}

enum ShoppingStatus {
    case inCart
    case liked
    case empty
}
