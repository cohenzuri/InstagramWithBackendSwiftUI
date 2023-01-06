//
//  SearchView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
     
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                Text("Searching for \(searchText)")
                
 //               PostGridView()
                UserListView()
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
