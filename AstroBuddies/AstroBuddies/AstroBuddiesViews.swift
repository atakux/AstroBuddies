//
//  AstroBuddiesViews.swift
//  AstroBuddies
//
//  Created by ataku x on 10/25/23.
//

import SwiftUI

struct LoginScreen: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            // AstroBuddies Title
            Text("AstroBuddies")
                .modifier(AstroBuddiesTitle())
            
            // login section

            VStack {
                // Login label
                Text("Login")
                    .frame(width: 280, height: 80, alignment: .leading)
                    .font(.custom("Inter", size: 30).weight(.bold))
                    .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
                
                // username textfield
                TextField("Username", text: $username)
                    .modifier(TextBoxLabel())
                    .modifier(TextBox())
                
                
                // password textfield
                TextField("Password", text: $password)
                    .modifier(TextBoxLabel())
                    .modifier(TextBox())
                
                // submit button
                // TODO: here is where we should compare the log in data to the user's original credentials to validate their login. after clicking submit, if valid, go to the home page, otherwise error.
                Button( action: {
                    print("username: \($username) submitted")
                }) {
                    Text("Submit")
                }
                .modifier(ButtonTextModifier())
                .modifier(ButtonModifier())
            }
            
            // TODO: make this more like a button rather than text, so that when user clicks it, it takes them to the sign up page.
            VStack {
                Text("Don't have an account yet?\n\nSign Up!")
                    .font(.custom("Inter", size: 16).weight(.semibold))
                    .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
                    .multilineTextAlignment(.center)
            }
            
        }
        .modifier(AppBackground())
    }
    
    
}

struct SignUpScreen: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            // AstroBuddies Title
            Text("AstroBuddies")
                .modifier(AstroBuddiesTitle())
            
            // login section

            VStack {
                // Sign up label
                Text("Sign up")
                    .frame(width: 280, height: 80, alignment: .leading)
                    .font(.custom("Inter", size: 30).weight(.bold))
                    .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
                
                // username textfield
                TextField("Username", text: $username)
                    .modifier(TextBoxLabel())
                    .modifier(TextBox())
                
                // email textfield
                TextField("Email", text: $email)
                    .modifier(TextBoxLabel())
                    .modifier(TextBox())
                
                // password textfield
                TextField("Password", text: $password)
                    .modifier(TextBoxLabel())
                    .modifier(TextBox())
                
                // confirm password textfield
                TextField("Confirm Password", text: $password)
                    .modifier(TextBoxLabel())
                    .modifier(TextBox())
                
                // submit button
                // TODO: we have to save the data into a database, if the confirm password & password match. save username, email, and encrypted password
                Button( action: {
                    print("username: \($username) submitted")
                }) {
                    Text("Submit")
                }
                .modifier(ButtonTextModifier())
                .modifier(ButtonModifier())
            }
            
            // TODO: make this more like a button rather than text, so that when user clicks it, it takes them to the log in page.
            VStack {
                Text("Already have an account?\n\nLog in!")
                    .font(.custom("Inter", size: 16).weight(.semibold))
                    .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
                    .multilineTextAlignment(.center)
            }
            
        }
        .modifier(AppBackground())
    }
}
