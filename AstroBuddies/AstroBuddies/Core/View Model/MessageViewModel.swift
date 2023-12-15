//
//  MessageViewModel.swift
//  AstroBuddies
//
//  Created by tvirata on 12/5/23.
//
import SwiftUI
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageViewModel: ObservableObject {
    @Published var messages: [Message] = []
    private var listener: ListenerRegistration? // firebase event listener
 
    init(messages: [Message] = []) { // initialize MessageViewModel so messages is not empty after each call
            self.messages = messages
        }
    
    func sendMessage(content: String, senderId: String, receiverId: String) {
        // create new message object using sender's text typed into the text field
        let message = Message(senderId: senderId, receiverId: receiverId, text: content, timestamp: Date())
        do {
            // add message to messages collection on firestore
            try Firestore.firestore().collection("messages").addDocument(from: message)
        } catch {
            print("Error sending message: \(error.localizedDescription)")
        }
    }

    func fetchMessages(currentUser: User, selectedUser: User) {
        // assign event listener to retrieve message documents between current user and selected user
        listener = Firestore.firestore().collection("messages")
            .whereField("senderId", in: [currentUser.id, selectedUser.id])
            .whereField("receiverId", in: [currentUser.id, selectedUser.id])
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("Error fetching messages: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                    self.messages = documents.compactMap { document -> Message? in
                        do {
                            return try document.data(as: Message.self)
                        } catch {
                            print("Error decoding message: \(error.localizedDescription)")
                            return nil
                        }
                    }
            }
    }
    
    func stopListening() {
        listener?.remove() // remove event listener
    }
}


class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    init() {
        fetchUsers() // initialize using fetchUsers function so that users array is not empty after first iteration
    }
    func fetchUsers() {
        // add snapshot listener to "users" collection from firestore database
        Firestore.firestore().collection("users")
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("Error fetching users: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                self.users = documents.compactMap { document -> User? in
                    do {
                        return try document.data(as: User.self)
                    } catch {
                        print("Error decoding user: \(error.localizedDescription)")
                        return nil
                    }
                }
            }
    }
}



