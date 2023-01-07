//
//  SearchView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var isInSeatchMode = false
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                if searchText.isEmpty {
                    PostGridView()
                } else {
                    UserListView()
                    Text("Searching for \(searchText)")
                }
            }
        }
        .searchable(text: $searchText)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
