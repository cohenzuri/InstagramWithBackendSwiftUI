//
//  ProfileViewModel.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/15/23.
//

import Foundation


class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
