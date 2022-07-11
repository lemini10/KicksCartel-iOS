//
//  RealTimeManager.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 09/07/22.
//

import Foundation
import FirebaseDatabase
import Combine

class RemoteDataManager {
    
    static var shared: RemoteDataManager = RemoteDataManager()
    
    init() {
        ref = Database.database().reference()
    }
    private let decoder = JSONDecoder()
    var ref: DatabaseReference!

    func fetchSneakers() -> Future<[FetchedSneaker], Error> {
        return Future { promise in
            var fetchedSneakers: [FetchedSneaker] = []
            
            self.ref.child("Sneakers").getData(completion:  { error, snapshot in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let json = snapshot?.value as? [String: Any] else { return }
                for sneaker in json.keys {
                    let id: String = sneaker
                    let sneakerModel = json[id]
                    do {
                        let sneakerData = try JSONSerialization.data(withJSONObject: sneakerModel)
                        let sneakerFetched = try self.decoder.decode(FetchedSneaker.self, from: sneakerData)
                        fetchedSneakers.append(sneakerFetched)
                    } catch {
                        promise(.failure(error))
                    }
                }
                promise(.success(fetchedSneakers))
            })
        }
    }
    
    func fetchNews() -> Future<[FetchedNews], Error> {
        return Future { promise in
            var fetchedSneakers: [FetchedNews] = []
            
            self.ref.child("News").getData(completion:  { error, snapshot in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let json = snapshot?.value as? [String: Any] else { return }
                for sneaker in json.keys {
                    let id: String = sneaker
                    let sneakerModel = json[id]
                    do {
                        let sneakerData = try JSONSerialization.data(withJSONObject: sneakerModel)
                        let sneakerFetched = try self.decoder.decode(FetchedNews.self, from: sneakerData)
                        fetchedSneakers.append(sneakerFetched)
                    } catch {
                        promise(.failure(error))
                    }
                }
                promise(.success(fetchedSneakers))
            })
        }
    }
}

struct FetchedSneaker: Decodable, Identifiable {
    var id: String { self.completeName }
    var brand: String
    var sneakerImage: String
    var completeName: String
    var price: String
}

struct FetchedNews: Decodable, Identifiable {
    var id: String { self.image }
    var categorie: String
    var image: String
    var title: String
}
