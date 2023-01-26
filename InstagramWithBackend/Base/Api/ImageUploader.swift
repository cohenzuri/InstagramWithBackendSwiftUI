//
//  ImageUploader.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/11/23.
//

import UIKit
import Firebase
import FirebaseStorage

enum UploadType {
    case profile
    case post
    func filePath(for filename: String) -> StorageReference { // TODO: add path builer
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(filename)")
        }
    }
}

struct ImageUploader {
    
    static func uploadImage(image: UIImage, type: UploadType, comletion: @escaping(String) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let fileName = NSUUID().uuidString
        let path = "/profile_images/\(fileName)"
        let ref = Storage.storage().reference(withPath: path)
        
        ref.putData(imageData, metadata: nil) { _, error in
            
            if let error = error { // TODO: error handeling
                print("falied to upload image to firebase \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                comletion(imageUrl)
            }
        }
    }
    
}
