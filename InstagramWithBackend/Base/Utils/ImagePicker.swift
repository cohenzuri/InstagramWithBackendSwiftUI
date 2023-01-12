//
//  ImagePicker.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/8/23.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    
    @Binding var image: UIImage?
    @State var selecteItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var handler: (UIImage) -> Void
    
    var body: some View {
        
        VStack {
     
            PhotosPicker(
                selection: $selecteItems,
                maxSelectionCount: 1,
                matching: .images
            ) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .padding()
                    .foregroundColor(.white)
                
            }.onChange(of: selecteItems) { newValue in
                guard let item = selecteItems.first else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    
                    switch result {
                    
                    case .success(let data):
                        if let data = data {
                            self.data = data
                            if let uiImage = UIImage(data: data) {
                                handler(uiImage)
                            }
                        } else {
                            print("data is nil")
                        }
                        
                    case .failure(let failure):
                        print("error: \(failure)")
                       //fatalError("\(failure)")
                    }
                }
            }
        }
    }
}

