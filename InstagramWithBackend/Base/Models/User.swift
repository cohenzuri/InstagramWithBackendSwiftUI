//
//  User.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/13/23.
//

import FirebaseFirestoreSwift

struct User: Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
}
