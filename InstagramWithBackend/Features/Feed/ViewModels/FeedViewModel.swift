//
//  FeedViewModel.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/27/23.
//

import Foundation

class FeedViewModel: ObservableObject {

    @Published var posts = [Post]()
    
    init() {
        self.fetchPost()
    }
    
    func fetchPost() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
        }
    }
}
