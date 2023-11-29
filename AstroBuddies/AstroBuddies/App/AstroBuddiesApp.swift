//
//  AstroBuddiesApp.swift
//  AstroBuddies
//
//  Created by ataku x on 10/25/23.
//

import SwiftUI
import Firebase

@main
struct AstroBuddiesApp: App {
    
    // initialize instance of AuthViewModel to use throughout app to be able to access its functionality wherever needed
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

