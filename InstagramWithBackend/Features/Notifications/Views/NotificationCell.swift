//
//  NotificationCell.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/7/23.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var isShowPostImage = false
    
    var body: some View {
        
        HStack {
            
            Image("profile_1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            
            Text("zuri_c").font(.system(size: 14, weight: .semibold)) +
            Text(" I love this photo! The colors are so vibrant an ❤️")
                .font(.system(size: 15))
            
            Spacer()
            
            if isShowPostImage {
                
                Image("profile_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button() {
                    
                } label: {
                    Text("Follow")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .font(.system(size: 14, weight: .semibold))
                }
                .background(Color(.systemBlue))
                .clipShape(Capsule())
                .padding()
            }
                
           
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
