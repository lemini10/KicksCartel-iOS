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
    private let decoder = JSONDecoder()
    
    func fetchSneakers() -> Future<[FetchedSneaker], Error> {
        return Future { promise in
            var ref: DatabaseReference!
            ref = Database.database().reference()
            var fetchedSneakers: [FetchedSneaker] = []
            
            ref.child("Sneakers").getData(completion:  { error, snapshot in
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
    
    func fetchNews() -> Future<[FetchedSneaker], Error> {
        return Future { promise in
            var ref: DatabaseReference!
            ref = Database.database().reference()
            var fetchedSneakers: [FetchedSneaker] = []
            
            ref.child("Sneakers").getData(completion:  { error, snapshot in
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
}

struct FetchedSneaker: Decodable, Identifiable {
    var id: String { self.completeName }
    var brand: String
    var sneakerImage: String
    var completeName: String
    var price: String
}
