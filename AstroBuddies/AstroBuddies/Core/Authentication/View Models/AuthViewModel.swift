//
//  AuthViewModel.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//

import Foundation
import Firebase

// class conforms to the ObservableObject protocol to be able to observe changes in the AuthViewModel
class AuthViewModel: ObservableObject {
    
    // tells use whether a user is logged in (optional)
    // will tell the app whether to route to the LoginView or the HomeView
    @Published var userSession: FirebaseAuth.User?
    
    // User object in Model
    @Published var currentUser: User?
    
    init() {
        
    }
    
    
    func login(withUsername username: String, password: String) async throws {
        /*
         login function:
            - takes in username and password.
         */
        
        print("logged in")
    }
    
    func signUp(withUsername username: String, email: String, password: String) async throws {
        /*
         createUser function
            - takes in username, email, password
         */
        
        print("signed up")
    }
    
    func logout() {
        /*
         logout function
            - signs current user out of their session
         */
    }
    
    func fetchUserData() async {
        /*
         fetchUserData function
            - retrieves user data
         */
    }
}
