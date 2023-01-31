//
//  Post.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/27/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Decodable, Identifiable {
    @DocumentID var id: String?
    let ownerUid: String
    var ownerUsername: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    var didLike: Bool? = false
}
