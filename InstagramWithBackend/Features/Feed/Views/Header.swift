//
//  Header.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/16/23.
//

import SwiftUI

struct Header: View {
    
    var body: some View {
        HStack {
            
            HStack{
                
                Button {
                    
                } label: {
                    
                    Image(Theme.Images.camera_icon).resizable().frame(width: 24, height: 22)
                }
                
                Spacer()
                
            }.padding()
            
            
            Image(Theme.Images.instagram_small_text_logo).resizable().frame(width: 105, height: 28)
            
            HStack(spacing: 15){
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(Theme.Images.live_icon).resizable().frame(width: 24, height: 22)
                }
                
                Button  {
                    
                } label: {
                    Image(Theme.Images.send_icon).resizable().frame(width: 24, height: 22)
                }
                
            }.padding()
            
        }.background(Theme.Colors.header_background)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
