//
//  ProfileHeaderView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/8/23.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(spacing: 16) {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                UserStatView(value: 3, title: "Post")
                UserStatView(value: 2, title: "Following")
                UserStatView(value: 4, title: "Followers")
                
            }
            .padding(.trailing, 32)
            
            Text(user.fullName)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gothams Dark kingth || Billionere")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
                Spacer()
            }
            Spacer()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(userName: "userName", fullName: "fullName", email: "email", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagramclone-ac2fa.appspot.com/o/profile_images%2F4A2F2EB0-15FF-4EC6-AEBA-C6F7BDACA059?alt=media&token=6095da57-fd72-4df5-b074-635fce501f1e")
        
        ProfileHeaderView(user: user)
    }
}
