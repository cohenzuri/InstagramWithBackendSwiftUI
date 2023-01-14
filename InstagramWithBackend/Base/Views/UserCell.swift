//
//  UserCell.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/6/23.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        
        HStack {
            
            //AsyncImage(url: URL(string: user.profileImageUrl))
            KFImage(URL(string: user.profileImageUrl))
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                
                Text(user.userName)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(user.fullName)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    
            }
            
            Spacer()
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        //UserCell(user: User(from: Decoder as! Decoder))
//    }
//}
