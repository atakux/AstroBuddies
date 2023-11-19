//
//  LoginView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//

import SwiftUI

struct LoginView: View {
    // initialize variables to use within this view
    @State private var username = ""
    @State private var password = ""
    
    // create instance of AuthViewModel from the environmentObject we created in the App
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                
                // TODO: add astrobuddies logo at the top
                
                // AstroBuddies Title
                Text("AstroBuddies")
                    .modifier(AstroBuddiesTitle())
                
                // Login label
                Text("Login")
                    .modifier(HeaderModifier())

                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $username, placeholder: "Username")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, placeholder: "Password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                // sign in button
                Button {
                    Task {
                        try await viewModel.login(withUsername: username, password: password)
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
                NavigationLink(destination:
                                // navigate to the SignUp screen
                               SignupView()
                               // remove the back button at the top so user has to use provided buttons and navigation tools.
                                   .navigationBarBackButtonHidden(true),
                               label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account yet?\n\nSign Up!")
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

