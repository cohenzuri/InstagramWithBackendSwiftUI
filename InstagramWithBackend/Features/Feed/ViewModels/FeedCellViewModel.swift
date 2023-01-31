//
//  FeedCellViewModel.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/31/23.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() {
        print("like post")
    }
    
    func unlike() {
        print("unlike post")
    }
    
    func checkIfUserLikedPost() {
        
    }
}
