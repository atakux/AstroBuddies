//
//  ContentView.swift
//  AstroBuddies
//
//  Created by ataku x on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                // if there is a user session currently running, open to HomeView when app is launched
                HomeView()
            } else {
                // otherwise, open to LoginView when app is launched to prompt user to login, or create an account
                LoginView()
            }
        }
    }
}
