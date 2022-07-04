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
    let constants: Constants = Constants()
    
    init(shoeDetails: SneakerModel) {
        self.shoeDetails = shoeDetails
    }
}

extension DetailViewModel {
    struct Constants {
        let backwardsIcon: String = "arrowshape.turn.up.backward.fill"
        let shareIcon: String = "square.and.arrow.up"
    }
}
