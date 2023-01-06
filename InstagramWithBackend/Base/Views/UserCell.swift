//
//  UserCell.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/6/23.
//

import SwiftUI

struct UserCell: View {
    
    var body: some View {
        
        HStack {
            
            Image("profile_1")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                
                Text("zuri_c")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("sub title")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
