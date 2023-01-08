//
//  ProfileView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
       
        ScrollView {
            
            VStack(spacing: 32) {
                ProfileHeaderView()
                PostGridView()
            }.padding(.top)
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
