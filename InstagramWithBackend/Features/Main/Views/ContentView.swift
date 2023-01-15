//
//  ContentView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authVm: AuthenticationViewModel
    
    var body: some View {
        Group {
            if authVm.userSession == nil {
                LoginView()
            } else {
                if let user = authVm.currentUser {
                    MainTabView(user: user)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
