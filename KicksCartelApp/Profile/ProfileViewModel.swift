//
//  ProfileViewModel.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import Foundation
import FirebaseAuth
import Combine

protocol ProfileViewModelProtocol: ObservableObject {
    var isUserRegistered: Bool { get set }
    var email: String { get set }
    var password: String { get set }
    var selectedIndex: Int { get set }
    
    func onAppear()
    func doLogin()
    func doRegister()
    func doLogOut()
}

class ProfileViewModel: ProfileViewModelProtocol {
    
    @Published var isUserRegistered: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var selectedIndex: Int = 0
    
    func onAppear() {
        isUserRegistered = Auth.auth().currentUser != nil
    }
    
    func doLogin() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard error == nil else { return }
            self?.onAppear()
        }
    }
    
    func doRegister() {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard error == nil else { return }
            self?.onAppear()
        }
    }
    
    func doLogOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.onAppear()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
