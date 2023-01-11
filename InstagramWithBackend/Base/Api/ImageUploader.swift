//
//  ImageUploader.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/11/23.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage, comletion: @escaping(String) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let fileName = NSUUID().uuidString
        let path = "/profile_images/\(fileName)"
        let ref = Storage.storage().reference(withPath: path) 
    }
    
}
