//
//  FeedView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct FeedView: View {
    
    var body: some View {
        
        ScrollView {
            
            ForEach(0..<20) {  _ in
                FeedCell()
            }
        }
        Text("Feed View")
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
