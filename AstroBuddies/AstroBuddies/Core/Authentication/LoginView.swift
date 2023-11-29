//
//  LoginView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//

import SwiftUI

struct LoginView: View {
    // initialize variables to use within this view
    @State private var email = ""
    @State private var password = ""
    
    // create instance of AuthViewModel from the environmentObject we created in the App
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                // TODO: add astrobuddies logo at the top
                
                // AstroBuddies Title
                Text("AstroBuddies")
                    .modifier(AstroBuddiesTitle())
                
                // Login label
                Text("Login")
                    .modifier(HeaderModifier())

                // TODO: ensure that the password entered is the same password (decrypted) as the one linked to that username in the database
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email, placeholder: "Email")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, placeholder: "Password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                // sign in button
                Button {
                    Task {
                        try await viewModel.login(withEmail: email, password: password)
                    }
                    
                } label: {
                    HStack {
                        Text("Login")
                    }
                    .modifier(ButtonTextModifier())
                }
                .modifier(ButtonModifier())
                .padding(.top)
                
                Spacer()
                
                // navigate to the SignupView so user can create an account
                // also remove the back button at the top so user has to use provided buttons and navigation tools.
                NavigationLink(destination: SignupView().navigationBarBackButtonHidden(true),
                               label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account yet?\nSign Up!")
                            .modifier(TextModifier())
                            .multilineTextAlignment(.center)
                    }
                })
                    
                
                Spacer()
            }
            .modifier(AppBackground())
        }
    }
}

