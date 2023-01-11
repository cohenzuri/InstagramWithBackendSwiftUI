//
//  InstagramWithBackendApp.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI
import Firebase

@main
struct InstagramWithBackendApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
            ContentView().environmentObject(AuthenticationViewModel.shared)
            
        }
    }
}
