//
//  UploadPostView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var captionText = ""
    @State var showImagePicker = false
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        
        VStack {
            if selectedImage == nil {
                ImagePicker(image: $selectedImage) { image in
                    selectedImage = image
                }
            } else {
                VStack(spacing: 70) {
                    HStack(alignment: .top) {
                        
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 96)
                            .clipped()
                        
                        TextArea(placeholder: "Enter your caption..", text: $captionText)
                            .frame(height: 200)
                    }
                    HStack {
                        Button {
                            captionText = ""
                            selectedImage = nil
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 50)
                                    .foregroundColor(.red)
                                Text("Cancel").font(.system(size: 16, weight: .semibold ))
                                    .foregroundColor(.white)
                            }
                        }
                        Button {
                            if let image = selectedImage {
                                viewModel.uploadPost(caption: captionText, image: image) { _ in
                                    captionText = ""
                                    selectedImage = nil
                                    tabIndex = 0
                                }
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 50)
                                    .foregroundColor(.blue)
                                Text("Share").font(.system(size: 16, weight: .semibold ))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}
