//
//  MainTabView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct MainTabView: View {
    
    let user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        NavigationView {
            
            TabView(selection: $selectedIndex) {
                
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: Theme.Images.home)
                    }.tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: Theme.Images.search)
                    }.tag(1)
                
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: Theme.Images.add)
                    }.tag(2)
                
                NotificationsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: Theme.Images.heart)
                    }.tag(3)
                
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: Theme.Images.profile)
                    }.tag(4)
            }
            .navigationTitle(tabTitle)
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
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Fead"
        case 1: return "Explore"
        case 2: return "New Post"
        case 3: return "Notifications"
        case 4: return "Profile"
        default: return ""
        }
    }
}

