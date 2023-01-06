//
//  PostGridView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/6/23.
//

import SwiftUI

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        
        LazyVGrid(columns: items, spacing: 2, content:  {
            
            ForEach(0..<10) { _ in
                
                Image("post_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipped()
            }
        })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
