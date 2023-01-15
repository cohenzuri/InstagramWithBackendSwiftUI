//
//  ProfileActionButtonView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/8/23.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    @ObservedObject var profileVm: ProfileViewModel
    var isFollowed: Bool { return profileVm.user.isFollowed ?? false }
    
    var body: some View {
        
        if profileVm.user.isCurrentUser {
            
            Button {
                
                print("did tap profile action")
                
            } label: {
                
                Text("Edit Profile")
                
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.white) // TODO: add custom color
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        } else {
            
            HStack {
                
                Button {
                    isFollowed ? profileVm.unfollow() : profileVm.follow()
                } label: {
                    
                    Text(isFollowed ? "Following" : "Follow")
                    
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white) // TODO: add custom color
                        .background(isFollowed ? Color.white : Color.blue)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                }
                .cornerRadius(3)
                
                Button {
                    
                    print("did tap message")
                    
                } label: {
                    
                    Text("Message")
                    
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.white) // TODO: add custom color
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }
        }
    }
}
