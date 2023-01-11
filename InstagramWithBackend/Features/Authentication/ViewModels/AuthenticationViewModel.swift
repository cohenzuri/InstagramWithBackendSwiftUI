//
//  AuthenticationViewModel.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/10/23.
//

import Foundation
import Firebase
import UIKit

class AuthenticationViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthenticationViewModel()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login() {
        print("login")
    }
    
    func register(email: String, password: String, image: UIImage, fullName: String, userName: String) {
        
        print("register email: \(email) pass: \(password)")
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print(error.localizedDescription) // TODO: add error handeling here!
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("user registered! ")
            
        }
    }
    
    func signout() {
        
        print("signout")
        
        self.userSession = nil
        
        try? Auth.auth().signOut() // TODO: add error handeling here!
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        print("fetchUser")
    }
}
