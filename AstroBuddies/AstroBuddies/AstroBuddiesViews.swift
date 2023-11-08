//
//  AstroBuddiesViews.swift
//  AstroBuddies
//
//  Created by ataku x on 10/25/23.
//

import SwiftUI

struct LoginScreen: View {
    // Log in Screen View
    /* Allows user to input their already registered username and correct password.
       Checks if the username is in the database and if the decrypted password matches the password linked to their username in the database.
     */
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
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
                    SecureField("Password", text: $password)
                        .modifier(TextBoxLabel())
                        .modifier(TextBox())
                    
                    // submit button
                    Button( action: {
                        print("username: \($username) submitted")
                        // TODO: check if username is in the database
                        // TODO: check if submitted password matches the decrypted password linked to the username typed in
                        // TODO: if matches, proceed to homepage
                        
                    }) {
                        NavigationLink(destination: HomeScreen()) {
                            Text("Submit")
                        }
                    }
                    .modifier(ButtonTextModifier())
                    .modifier(ButtonModifier())
                }
                
                // when user clicks the following text view, it takes them to the sign up page.
                VStack {
                    NavigationLink(destination: SignUpScreen()) {
                        Text("Don't have an account yet?\n\nSign Up!")
                            .font(.custom("Inter", size: 16).weight(.semibold))
                            .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
                            .multilineTextAlignment(.center)
                    }
                }
                
            }
            .modifier(AppBackground())
        }
        // the following makes it so the user must click the sign up rather than a back button
        .navigationBarBackButtonHidden(true)
    }
    
    
}

struct SignUpScreen: View {
    // Sign Up Screen View
    /* Allows user to input Username, Email, Password and Confirm Password in order to create an acocount on AstroBuddies.
       This information is then securely saved into the database. Passwords are encrypted.
     */
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // AstroBuddies Title
                Text("AstroBuddies")
                    .modifier(AstroBuddiesTitle())
                
                // sign up section

                VStack {
                    // Sign up label
                    Text("Sign up")
                        .frame(width: 280, height: 50, alignment: .leading)
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
                        .keyboardType(.emailAddress)
                    
                    // password textfield
                    SecureField("Password", text: $password)
                        .modifier(TextBoxLabel())
                        .modifier(TextBox())
                    
                    // confirm password textfield
                    SecureField("Confirm Password", text: $confirmPassword)
                        .modifier(TextBoxLabel())
                        .modifier(TextBox())
                    
                    // submit button
                    Button( action: {
                        print("\(username) SLAYYY")
                        
                        if password == confirmPassword {
                            print("yay!")
                            // TODO: encrypt password, store username, email, and encrypted password into database.
                            // TODO: next view should lead to an email verification view for the user to go verify their email and type in a specific code. if the codes match, then proceed to home page
                        } else {
                            print("boo")
                            // TODO: let user know that their passwords didnt match and let them re-enter passwords.
                        }
                    }) {
                        Text("Submit")
                    }
                    .modifier(ButtonTextModifier())
                    .modifier(ButtonModifier())
                }
                
                // when user clicks the following text view, it takes them to the log in page.
                VStack {
                    NavigationLink(destination: LoginScreen()) {
                        Text("Already have an account?\n\nLog in!")
                            .font(.custom("Inter", size: 16).weight(.semibold))
                            .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
                            .multilineTextAlignment(.center)
                    }
                }
                
                Spacer()
                
            }
            .modifier(AppBackground())
            .frame(width: 300, height: 100)
        }
        // the following makes it so user must click the button asking for login rather than a back button
        .navigationBarBackButtonHidden(true)
    }
}


struct HomeScreen: View {
    var body: some View {
        
        // TODO: do home screen UI. fix the weird bug where it keeps "Home Screen" at the top every where you toggle.
        
        VStack {
            VStack {
                Text("Home Screen")
            }
        }.modifier(AppBackground())
            .frame(width: 300, height: 100)
        
        TabBar()
    }
}



struct TarotReading: View {
    var body: some View {
        // TODO: do tarot screen UI. fix the weird bug where it keeps "Home Screen" at the top every where you toggle.
        
        VStack {
            VStack {
                Text("Tarot Screen")
            }
        }.modifier(AppBackground())
            .frame(width: 300, height: 100)
        
        TabBar()
    }
}

struct Compatibility: View {
    var body: some View {
        // TODO: do compatibility screen UI. fix the weird bug where it keeps "Home Screen" at the top every where you toggle.
        VStack {
            VStack {
                Text("Compatibility Screen")
            }
        }.modifier(AppBackground())
            .frame(width: 300, height: 100)
        
        TabBar()
    }
}

struct Messaging: View {
    var body: some View {
        // TODO: do messaging screen UI. fix the weird bug where it keeps "Home Screen" at the top every where you toggle.
        VStack {
            VStack {
                Text("Messaging Screen")
            }
        }.modifier(AppBackground())
            .frame(width: 300, height: 100)
        
        TabBar()
    }
}
