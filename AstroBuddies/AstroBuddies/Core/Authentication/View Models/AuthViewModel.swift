//
//  AuthViewModel.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


protocol AuthenticationFormProtocol {
    // determine if the form is properly filled out
    var formIsValid: Bool { get }
}

// the following declaration publishes all UI updates on the main thread
@MainActor

// class conforms to the ObservableObject protocol to be able to observe changes in the AuthViewModel
class AuthViewModel: ObservableObject {
    
    // tells use whether a user is logged in (optional)
    // will tell the app whether to route to the LoginView or the HomeView
    @Published var userSession: FirebaseAuth.User?
    
    // User object in Model
    @Published var currentUser: User?
    
    init() {
        // ensures the app keeps the user logged in, unless they sign out
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUserData()
        }
    }
    
    
    func login(withEmail email: String, password: String) async throws {
        /*
         login function:
            - takes in username and password.
         */
        
        // TODO: may need to fix what user is signing in with (username vs email) to correspond to firebase way of signing in
        
        // TODO: password authentication
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
            self.userSession = result.user
            
            // fetch data from firebase so that views can be rendered properly
            await fetchUserData()
            
        } catch {
            print("DEBUG: Failed to login with error \(error.localizedDescription)")
        }
    }
    
    func signUp(withUsername username: String, email: String, password: String, sunSign: Starsign) async throws {
        /*
         createUser function
            - takes in username, email, password
         */
        
        // TODO: password encryption/authentication
        
        do {
            // try to create a user using the firebase code
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            // creating a user object corresponding to the User model
            let user = User(id: result.user.uid, username: username, email: email, sunSign: sunSign)
            
            // encode the user thru the Codable protocol
            let encodedUser = try Firestore.Encoder().encode(user)
            
            // upload encodeUser data to firestore
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
            // fetch the user data as soon as the user is created
            await fetchUserData()
            
        } catch {
            // if anything goes wrong, it will display the error
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func logout() {        
        /*
         logout function
            - signs current user out of their session
         */
        
        do {
            // signs out user on backend
            try Auth.auth().signOut()
            
            // sets userSession to nil and goes back to LoginView, then also sets currentUser to nil in order to remove any lingering data models
            self.userSession = nil
            self.currentUser = nil
            
        } catch {
            print("DEBUG: Failed to log out with error \(error.localizedDescription)")
        }
    }
    
    
    
    func fetchUserData() async {
        /*
         fetchUserData function
            - retrieves user data
         */
        
        // TODO: figure out how to fetch user DOB, zodiac signs, etc (once data is available in the database)
        
        // get the current user's id
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // fetching user data from firebase
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current user is \(self.currentUser)")
        
    }
}
