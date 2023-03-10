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
    @Published var currentUser: User?

    static let shared = AuthenticationViewModel()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Error: Login failed \(error.localizedDescription)") // TODO: error handeling
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, fullName: String, userName: String) {
        
        guard let profileImage = image else {
            print("There is no profile image to register") // TODO: error handeling
            return
        }
        
        ImageUploader.uploadImage(image: profileImage, type: .profile) { imageUrl in
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                
                if let error = error {
                    print(error.localizedDescription) // TODO: add error handeling here!
                    return
                }
                
                guard let user = result?.user else { return }
                
                let data = [
                    "email": email,
                    "userName": userName,
                    "fullName": fullName,
                    "profileImageUrl": imageUrl,
                    "uid": user.uid
                ]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    self.userSession  = user
                    self.fetchUser()
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut() // TODO: add error handeling here!
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
