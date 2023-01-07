//
//  Extentions.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/7/23.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
