//
//  ImagePicker.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/8/23.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    
    @State var selecteItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {
        
        VStack {
            
            if let data = data, let uiumage = UIImage(data: data) {
                Image(uiImage: uiumage)
                    .resizable()
            }
           
            PhotosPicker(
                selection: $selecteItems,
                maxSelectionCount: 1,
                matching: .images
            ) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .padding(.top, 56)
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
                        } else {
                            print("data is nil")
                        }
                        
                    case .failure(let failure):
                       fatalError("\(failure)")
                    }
                }
            }
        }
    }
}

