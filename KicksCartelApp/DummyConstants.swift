//
//  DummyConstants.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 29/06/22.
//

import Foundation

struct CONSTANTS {
    static var sneakerModel: SneakerModel = SneakerModel(
        id: UUID(),
        brand: "Jordan",
        imageSet: ["Guava", "Guava", "Guava", "Guava"],
        sneakerImage: "Guava",
        completeName: "Jordan 4 x Union Guava Ice",
        description:  """
    Guava Ice delivers a vibrant take on the classic silhouette. The upper combines soft pink suede with breathable mesh on the collar and toe box. Semi translucent TU wings provide structural support, taking cues from an original Tinker Hatfield sketch.
    """,
        size: "10.5",
        price: "180 USD",
        shoppingStatus: .inCart)
    
    static var dummyAvailableSizes = [[ShoeInfo(id: UUID(), isAvailable: true, size: "4")]]
}
