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
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                
                if let error = error {
                    print(error.localizedDescription) // TODO: add error handeling here!
                    return
                }
                
                guard let user = result?.user else { return }

                print("user registered!")
                
                let data = [
                    "email": email,
                    "userName": userName,
                    "fullName": fullName,
                    "profileImageUrl": imageUrl,
                    "uid": user.uid
                ]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    self.userSession  = user
                }
            }
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
