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
                
                ProfileView()
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
        MainTabView()
    }
}
