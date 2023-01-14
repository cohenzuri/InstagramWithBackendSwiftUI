//
//  UserListView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/6/23.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var searchVm: SearchViewModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                ForEach(searchVm.users) { _ in
                    NavigationLink {
                        ProfileView()
                    } label: {
                        UserCell()
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(searchVm: SearchViewModel())
    }
}
