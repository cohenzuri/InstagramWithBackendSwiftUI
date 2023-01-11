//
//  RegisterView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/9/23.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var authVm: AuthenticationViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
