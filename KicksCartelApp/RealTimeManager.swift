//
//  RealTimeManager.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 09/07/22.
//

import Foundation
import FirebaseDatabase
import Combine
import FirebaseAuth

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

    func fetchLastSeenItems() -> Future<[FetchedSneaker], Error> {
        return Future { promise in
            var fetchedSneakers: [FetchedSneaker] = []
            
            self.ref.child("users").getData(completion:  { error, snapshot in
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
    
    func fetchFavorites() -> Future<[FetchedSneaker], Error> {
        return Future { promise in
            var fetchedSneakers: [FetchedSneaker] = []
            guard let userID = Auth.auth().currentUser?.uid else { return }
            self.ref.child("users").child("\(userID)").child("Favorites").observe(DataEventType.value, with: { snapshot in
                guard let json = snapshot.value as? [String: Any] else { return }
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
    
    func addToFavorites(item: FetchedSneaker) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let encoder = JSONEncoder()
        let path = self.ref.child("users").child("\(userID)").child("Favorites").child("\(item.id)")
        do {
            let data = try encoder.encode(item)
            let json = try JSONSerialization.jsonObject(with: data)
            path.setValue(json)
        } catch {
            print("Error while adding to favorites")
        }
    }
    
    func deleteFavorites(item: FetchedSneaker, completion: ()->Void?) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        self.ref.child("users").child("\(userID)").child("Favorites").child("\(item.id)").removeValue()
        completion()
    }

    func fetchCartItems() -> Future<[FetchedSneaker], Error> {
        return Future { promise in
            var fetchedSneakers: [FetchedSneaker] = []
            guard let userID = Auth.auth().currentUser?.uid else { return }
            self.ref.child("users").child("\(userID)").child("Cart").observe(DataEventType.value, with: { snapshot in
                guard let json = snapshot.value as? [String: Any] else { return }
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
    func addToCart(item: FetchedSneaker) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let encoder = JSONEncoder()
        let path = self.ref.child("users").child("\(userID)").child("Cart").child("\(item.id)")
        do {
            let data = try encoder.encode(item)
            let json = try JSONSerialization.jsonObject(with: data)
            path.setValue(json)
        } catch {
            print("Error while adding to favorites")
        }
    }
    
    func deleteCart(item: FetchedSneaker, completion: ()->Void?) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        self.ref.child("users").child("\(userID)").child("Cart").child("\(item.id)").removeValue()
        completion()
    }
}

struct FetchedSneaker: Codable, Identifiable {
    var id: String { self.completeName }
    var brand: String
    var sneakerImage: String
    var completeName: String
    var price: String
    var description: String
    var imageSet: ImageSet
    var size: String?
}

struct ImageSet: Codable {
    var firstImage: String
    var secondImage: String
    var thirdImage: String
}

struct FetchedNews: Decodable, Identifiable {
    var id: String { self.image }
    var categorie: String
    var image: String
    var title: String
}
