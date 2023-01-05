//
//  FeedCell.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Image("profile_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36,height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text("zuri_c")
                    .font(.system(size: 14,
                                  weight: .semibold))
            }
            
            Image("post_1")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            HStack {
                
                Button {
                    
                } label: {
                    
                    Image(Theme.Images.comment)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                    
                }
                
                Button {
                    
                } label: {
                    
                    Image(Theme.Images.save)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                    
                }
                
                Button {
                    
                } label: {
                    
                    Image(Theme.Images.heart)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                    
                }
            }
            
            HStack {
                
                Text("zuri_c").font(.system(size: 14, weight: .semibold)) +
                Text(" Feeling grateful for all the little things in life ❤️").font(.system(size: 15))
            }
            
            Text("2d").font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.top)
            
        }.padding()
        
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
