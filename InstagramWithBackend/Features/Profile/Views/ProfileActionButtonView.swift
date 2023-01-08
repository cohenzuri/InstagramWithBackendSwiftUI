//
//  ProfileActionButtonView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/8/23.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    var isCurrentUser = false
    var isFllowed = false
    
    var body: some View {
        
        if isCurrentUser {
            
            Button {
                
                print("did tap profile action")
                
            } label: {
                
                Text("Edit Profile")
                
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black) // TODO: add custom color
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            
        } else {
            
            HStack {
                
                Button {
                    
                    print("did tap follow")
                    
                } label: {
                    
                    Text(isFllowed ? "Following" : "Follow")
                    
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFllowed ? .black : .white) // TODO: add custom color
                        .background(isFllowed ? Color.white : Color.blue)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFllowed ? 1 : 0)
                        )
                }.cornerRadius(3)
                
                Button {
                    
                    print("did tap message")
                    
                } label: {
                    
                    Text("Message")
                    
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black) // TODO: add custom color
                    
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
             
            }
            
        }
        
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView()
    }
}
 
