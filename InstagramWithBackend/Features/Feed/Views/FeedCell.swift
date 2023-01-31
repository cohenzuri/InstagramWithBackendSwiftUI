//
//  FeedCell.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    @ObservedObject var feedCellVM: FeedCellViewModel
    
    var didLike: Bool { return feedCellVM.post.didLike ?? false } 
    
    init(viewModel: FeedCellViewModel) {
        self.feedCellVM = viewModel
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            header
            
            KFImage(URL(string: feedCellVM.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            buttonActionSection
            
            Text("\(feedCellVM.post.likes) likes").font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            HStack {
                Text(feedCellVM.post.ownerUsername).font(.system(size: 14, weight: .semibold)) +
                Text(feedCellVM.post.caption)
                    .font(.system(size: 15))
            }.padding(.horizontal, 8)
            
            Text("2d").font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, 4)
        }
    }
}

extension FeedCell {
    
    var header: some View {
        HStack {
            KFImage(URL(string: feedCellVM.post.ownerImageUrl))
                .scaledToFill()
                .frame(width: 36,height: 36)
                .clipped()
                .cornerRadius(18)
            Text(feedCellVM.post.ownerUsername)
                .font(.system(size: 14,
                              weight: .semibold))
        }
        .padding([.leading, .bottom], 8)
    }
    
    var buttonActionSection: some View {
        
        HStack(spacing: 16) {
            
            Button {
                
            } label: {
                Image(Theme.Images.comment)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
            }
            
            Button {
                
            } label: {
                
                Image(Theme.Images.save)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
            }
            
            Button {
                self.didLike ? feedCellVM.unlike() : feedCellVM.like()
            } label: {
                Image(systemName: didLike ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFill()
                foregroundColor( didLike ? .red : .black)
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
            }
        }
        .padding(.leading, 4)
    }
}
