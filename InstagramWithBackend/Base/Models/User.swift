//
//  User.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/13/23.
//

import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    let userName: String
    let fullName: String
    let email: String
    let profileImageUrl: String
    @DocumentID var id: String?
    var isFollowed: Bool? = false // This property is only in the client side for ui - and it's optional only beacons i use 'Decodable'
    var isCurrentUser: Bool { return AuthenticationViewModel.shared.userSession?.uid == id }
}

