//
//  MainTabView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

// TODO:
// add localizetions
// add unit tests

import SwiftUI

struct MainTabView: View {
    
    let user: User
    
    var body: some View {
        
        NavigationView {
            
            TabView {
                
                FeedView()
                    .tabItem {
                        Image(systemName: Theme.Images.home)
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: Theme.Images.search)
                    }
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: Theme.Images.add)
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: Theme.Images.heart)
                    }
                
                ProfileView(user: user)
                    .tabItem {
                        Image(systemName: Theme.Images.profile)
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.black)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension MainTabView {
    
    var logoutButton: some View {
        
        Button  {
            AuthenticationViewModel.shared.signout()
        } label: {
            Text("Logout").foregroundColor(.white)
        }
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        
        let user = User(userName: "userName", fullName: "fullName", email: "email", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagramclone-ac2fa.appspot.com/o/profile_images%2F4A2F2EB0-15FF-4EC6-AEBA-C6F7BDACA059?alt=media&token=6095da57-fd72-4df5-b074-635fce501f1e")
        
        MainTabView(user: user)
    }
}
