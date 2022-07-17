//
//  CheckoutViewModel.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 16/07/22.
//

import Foundation
import Combine

class CheckoutViewModel: ObservableObject {
    
    var items: [FetchedSneaker]
    var model: CardModel = CardModel(type: .Credit, name: "Luis Lemini", maskedNumbers: "**** **** **** 0000")
    
    init(items: [FetchedSneaker]) {
        self.items = items
    }
    
    func purchaseItems() {
        RemoteDataManager.shared.purchaseItems() {
            print("Successfully purchased")
        }
    }
}
