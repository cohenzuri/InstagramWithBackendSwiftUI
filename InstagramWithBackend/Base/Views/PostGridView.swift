//
//  PostGridView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/6/23.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    @ObservedObject var postGridVm: PostGridViewModel
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.postGridVm = PostGridViewModel(config: config)
    }
    
    var body: some View {
        
        LazyVGrid(columns: items, spacing: 2, content:  {
            
            ForEach(postGridVm.posts) { post in
                
                NavigationLink {
                    FeedView()
                } label: {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }
            }
        })
    }
}
