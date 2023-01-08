//
//  UploadPostView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    
    var body: some View {
    
        VStack {
            
            if postImage != nil {
                
                Button {

                  print("did tap upload post")

                } label: {
                    
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.white)
                }
                
            } else {
                
                VStack(spacing: 70) {
                    
                    HStack(alignment: .top) {
                        
                        Image("post_1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 96)
                            .clipped()
                        
                        TextField("Enter your caption..",
                                  text: $captionText)
                    }
                    
                    Button {
                        print("did tap post")
                    } label: {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height: 50)
                            
                            Text("Share").font(.system(size: 16, weight: .semibold ))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
