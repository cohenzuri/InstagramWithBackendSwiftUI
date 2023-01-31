//
//  ProfileView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var profileVm: ProfileViewModel
    
    let user: User
    
    init(user: User) {
        self.user = user
        self.profileVm = ProfileViewModel(user: user)
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 32) {
                ProfileHeaderView(profileVm: profileVm)
                //PostGridView(searchVm: <#SearchViewModel#>)
            }.padding(.top)
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(userName: "userName", fullName: "fullName", email: "email", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagramclone-ac2fa.appspot.com/o/profile_images%2F4A2F2EB0-15FF-4EC6-AEBA-C6F7BDACA059?alt=media&token=6095da57-fd72-4df5-b074-635fce501f1e")
        ProfileView(user: user)
    }
}
