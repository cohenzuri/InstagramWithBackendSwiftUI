//
//  ContentView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authVm: AuthenticationViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        Group {
            if authVm.userSession == nil {
                LoginView()
            } else {
                if let user = authVm.currentUser {
                    MainTabView(user: user, selectedIndex: $selectedIndex)
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
