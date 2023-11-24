//
//  ContentView.swift
//  AstroBuddies
//
//  Created by ataku x on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    
    // Create instance of AuthViewModel
    @EnvironmentObject var viewModel: AuthViewModel
    
    // Allows TabBar to disappear when in SettingsView & appear when in any other view
    @State public var isSettingsViewActive = false
    
    var body: some View {
        Group {
            // If there is a current user session, allow user to remain logged in even when not in the app
            if viewModel.userSession != nil {
                
                // If user is in the SettingsView, make TabBar disappear.
                if isSettingsViewActive {
                    SettingsView()
                        .onDisappear {
                            isSettingsViewActive = false
                        }
                } else {
                    // If user is not in SettingsView, they are on the HomeView and have access to the TabBar
                    TabBar()
                        .onAppear {
                            isSettingsViewActive = false
                        }
                }
                
            // If no current user session is in place, direct to LoginView for the user to either login to AstroBuddies or navigate to the SignupView to sign up for an account
            } else {
                LoginView()
            }
        }
    }
}
