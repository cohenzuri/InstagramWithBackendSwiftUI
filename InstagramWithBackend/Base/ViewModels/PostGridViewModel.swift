//
//  PostGridViewModel.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/31/23.
//

import Foundation

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig: PostGridConfiguration) {
        switch config {
        case.explore:
            self.fetchExplorePagePosts()
        case .profile(let uid):
            self.fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePagePosts() {
        COLLECTION_POSTS.getDocuments { snapshot, error in
            guard let document = snapshot?.documents else { return }
            self.posts = document.compactMap({try? $0.data(as: Post.self)})
        }
    }
    
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, error in
            guard let document = snapshot?.documents else { return }
            self.posts = document.compactMap({try? $0.data(as: Post.self)})
        }
    }
}
