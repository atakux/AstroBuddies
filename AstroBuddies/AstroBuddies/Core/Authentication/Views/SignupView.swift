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
    
    var body: some View {
        VStack {
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
            
            
            // sign up button
            Button {
                Task {
                    try await viewModel.signUp(withUsername: username, email: email, password: password)
                }
            } label: {
                HStack {
                    Text("Sign up")
                }
                .modifier(ButtonTextModifier())
            }
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.75)
            .modifier(ButtonModifier())
            .padding(.top)
            
            
            // already have an account navigation button
            // navigates to previous view which is the LoginView, so the user can log in since they already have an account
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?\n\nLogin!")
                        .modifier(TextModifier())
                        .multilineTextAlignment(.center)
                }
            }
            
            Spacer()
            Spacer()
            Spacer()

        }
        .modifier(AppBackground())
    }
}

extension SignupView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        // the form is valid if the following conditions are true
        return !username.isEmpty
        && !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        
    }
}