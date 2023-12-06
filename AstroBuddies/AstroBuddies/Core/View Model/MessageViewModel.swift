//
//  MessageViewModel.swift
//  AstroBuddies
//
//  Created by tvirata on 12/5/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class MessageViewModel: ObservableObject {
    @Published var messages: [Message] = []
    // User object in Model
    @Published var currentUser: User?
    let fs = Firestore.firestore() // firestore db
    var listenerRegistration: ListenerRegistration? // firebase event listener

    init() {
        loadMessages()
    }

    func loadMessages() {
        listenerRegistration = fs.collection("messages")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error loading messages: \(error.localizedDescription)")
                        return
                }

                guard let documents = querySnapshot?.documents else { return }

                self.messages = documents.compactMap { document in
                    try? document.data(as: Message.self)
                }
            }
    }

    
    func sendMessage(content: String) {
        // get current user's uid
        guard let currentUser = Auth.auth().currentUser
            else { return }
        let message = Message(user: currentUser.uid, text: content) // set message's user to user's uid and text
            do {
                _ = try fs.collection("messages").addDocument(from: message) // add new message to firestore collection
            } catch {
                print("Error sending message: \(error.localizedDescription)")
            }
        }
}
