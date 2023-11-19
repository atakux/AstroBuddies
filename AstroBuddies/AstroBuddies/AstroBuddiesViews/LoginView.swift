//
//  LoginView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    
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
                    print("logged in")
                } label: {
                    HStack {
                        Text("Login")
                    }
                    .modifier(ButtonTextModifier())
                }
                .modifier(ButtonModifier())
                .padding(.top)
                
                Spacer()
                
                // sign up if already have acc navigation
                NavigationLink {
                    SignupView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account yet?\n\nSign Up!")
                            .modifier(TextModifier())
                            .multilineTextAlignment(.center)
                    }
                }
                
                Spacer()
            }
            .modifier(AppBackground())
        }
    }
}

