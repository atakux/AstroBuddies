//
//  SettingsView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView {
            Spacer()
            
            // If a user is signed in, they can access to the Settings page
            if let user = viewModel.currentUser {
                
                // Settings
                VStack {
                    
                    // Top bar
                    HStack(alignment: .center) {
                        
                        VStack(alignment: .leading) {
                            
                            HStack {
                                // Back button to navigate back to the HomeView
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(systemName: "arrow.left.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                }
                                
                                Spacer(minLength: 2)
                                
                                // Settings Title
                                Text("Settings")
                                    .font(.title)
                                    .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                    .frame(alignment: .center)
                                    .padding()
                                
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                    }.frame(alignment: .leading)
                    
                    
                    // User profile header for settings
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Spacer(minLength: 2)
                            Spacer()
                            
                            // Display username
                            Text(user.username)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            // Display user's big 3
                            VStack(alignment: .center) {
                                Text("☉ \(user.sunSign?.rawValue ?? "invalid") ☾ moon sign ↑ rising sign")
                                    .font(.footnote)
                                    .modifier(TextModifier())
                                
                                Spacer(minLength: 1)
                            }
                        }
                    }.modifier(BackgroundTextModifier())
                }.padding()
                
                Divider()
                Spacer()
                
                // Settings buttons
                VStack{
                    
                    // Profile Settings
                    /*
                        Allows user to make changes to their profile and birth information
                     */
                    Button {
                        // TODO: implement a function for the user to edit their birth information that they entered when they first created an account
                        print("profile settings button clicked")
                    } label: {
                        SettingsRowView(imageName: "person.fill", title: "Profile Settings", tintColour: .purple)
                    }.modifier(SettingsButtonModifier())
                    
                    // Logout Button
                    /*
                        Logs current user out of their session from AstroBuddies & Firebase
                     */
                    Button {
                        viewModel.logout()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Log out", tintColour: .red)
                    }.modifier(SettingsButtonModifier())
                    
                    // Delete Account Button
                    /*
                        Deletes current user from AstroBuddies & Firebase
                     */
                    Button {
                        // TODO: add implementation to delete a user account
                        print("delete account")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColour: .red)
                    }.modifier(SettingsButtonModifier())
                }.padding()
                
                Spacer()
                Spacer()
                Spacer()
            }
            
        }.modifier(AppBackground())
    }
}

