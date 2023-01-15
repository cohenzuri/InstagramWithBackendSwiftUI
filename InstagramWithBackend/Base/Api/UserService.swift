//
//  UserService.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/15/23.
//

import Firebase

struct UserService {
    
    static func follow(uid: String, completion: @escaping (Error?) -> Void) {
        guard let currentUid = AuthenticationViewModel.shared.userSession?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unfollow() {
        
    }
    
    static func checkIfUserIsFollowed() {
        
    }
}
