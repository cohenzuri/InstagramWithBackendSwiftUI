//
//  UserListView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/6/23.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var searchVm: SearchViewModel
    @Binding var searceText: String
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                ForEach(searchVm.filteredUsers(searceText)) { user in
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        UserCell(user: user)
                            .padding(.leading)
                            .padding(.vertical, 10)
                    }
                }
            }
        }
    }
}

/*
struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(searchVm: previewSearchVm, searceText: <#T##Binding<String>#>)
    }
}
*/
