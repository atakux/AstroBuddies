//
//  SignupView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//

import SwiftUI

struct SignupView: View {
    // initialize variables to use within this view of the app
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    // create instance of AuthViewModel from the environmentObject initialized in the App
    @EnvironmentObject var viewModel: AuthViewModel
    

    // this is for navigating to the LoginView when user already had an account
    @Environment(\.dismiss) var dismiss
    
    @State private var navigateToBirthInfo = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                
                // AstroBuddies Title
                Text("AstroBuddies")
                    .modifier(AstroBuddiesTitle())
                
                // Sign Up label
                Text("Sign Up")
                    .modifier(HeaderModifier())

                // TODO: maybe add a UI indicator to show if the passwords do or do not match
                
                // TODO: encrypt and hash password to store in database
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $username, placeholder: "Username")
                        .autocapitalization(.none)
                    
                    InputView(text: $email, placeholder: "Email")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, placeholder: "Password", isSecureField: true)
                    
                    InputView(text: $confirmPassword, placeholder: "Confirm Password", isSecureField: true)
                }
                .padding(.horizontal)
                
                
                NavigationLink(destination: BirthInfoView(), isActive: $navigateToBirthInfo) {
                    EmptyView()
                }
                .hidden()
                
                // sign up button
                Button {
                    
                    // TODO: somehow make it so after the user registers their email, username, and password it takes them to the BirthInfoView to input their birth information
                    
                    if username != "" && email != "" {
                        // Assure that email and username were filled out
                        if password == confirmPassword {
                            // Assure that the confirmed password is the same as the password
                            
                            
                            navigateToBirthInfo = true
                        } else {
                            // TODO: do a pop up saying the passwords dont match
                            print("passwords dont match")
                        }
                    } else {
                        // TODO: do a pop up saying they didnt enter a username or email
                        print("you have to enter a username and email")
                    }
                    
                    
                    
                } label: {
                    HStack {
                        Text("Sign up")
                    }
                    .modifier(ButtonTextModifier())
                }
                .modifier(ButtonModifier())
                .padding(.top)
                
                
                
                
                
                // already have an account navigation button
                // navigates to previous view which is the LoginView, so the user can log in since they already have an account
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?\nLogin!")
                            .modifier(TextModifier())
                            .multilineTextAlignment(.center)
                    }
                }
                
                Spacer()
                Spacer()
                Spacer()

            }.modifier(AppBackground())
        }
        .modifier(AppBackground())
    }
}
