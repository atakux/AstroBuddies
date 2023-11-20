//
//  SettingsView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Spacer()
        VStack {
            if let user = viewModel.currentUser {
                List {
                    // TODO: change back button to be aesthetic
                    
                    // TODO: add settings buttons like account information for user to sign out and edit details
                    
                    Section {
                        // User profile header for settings
                        HStack {
                            VStack(alignment: .trailing, spacing: 4) {
                                Text(user.username)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text("sun sign moon sign rising sign")
                                    .font(.footnote)
                            }
                        }
                    }
                    
                    Section("Settings") {
                        Button {
                            viewModel.logout()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Log out", tintColour: .red)
                        }
                        
                        Button {
                            print("delete account")
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColour: .red)
                        }
                    }
                    
                    
                }
            }
        }.modifier(AppBackground())
    }
}

