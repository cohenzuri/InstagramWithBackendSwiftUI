//
//  PostGridView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/6/23.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    @ObservedObject var searchVm: SearchViewModel
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        
        LazyVGrid(columns: items, spacing: 2, content:  {
            
            ForEach(searchVm.posts) { post in
                
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
