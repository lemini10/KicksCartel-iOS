//
//  ItemDetailView.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 06/06/22.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    var shoeDetails: SneakerModel
    @Published var sizeSlideUpPresented: Bool = false
    
    init(shoeDetails: SneakerModel) {
        self.shoeDetails = shoeDetails
    }
}
