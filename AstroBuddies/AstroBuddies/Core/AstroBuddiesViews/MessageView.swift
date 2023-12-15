// ContentView.swift
import SwiftUI
import FirebaseAuth


struct ShowUsersView: View {
    @ObservedObject var usersVM = UsersViewModel()
    // Top edge value
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    
    
    // color codes
    let currColor = Color(red: 0.21, green: 0.34, blue: 0.57) // sender/currentUser color
    let recvColor = Color(red: 0.37, green: 0.35, blue: 0.64) // receiver/selectedUSer color
    let headerTextColor = Color(red: 0.96, green: 0.82, blue: 0.44) // header text color
    let headerColor = Color(red: 0.19, green: 0.16, blue: 0.18) // header background color
    let bg = Color(red: 0.27, green: 0.25, blue: 0.33) // main app background color
    var body: some View {
        VStack {
            // Top bar
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer(minLength: 2)
                            
                            // Message Title
                            Text("Messages")
                                .font(.title)
                                .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                .frame(alignment: .center)
                                .padding(.top, top)
                            
                            Spacer()
                            
                        }.padding(.horizontal)
                            .padding(.leading, 10)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 20)
                .frame(alignment: .leading)
            }
            .cornerRadius(22)
            
            NavigationView {
                // populate list with array of users from UsersViewModel
                List(usersVM.users) { user in
                    // nagivate to MessageView to view chat logs between current user and selected user
                    NavigationLink(destination: MessageView(selectedUser: user)) {
                        Text(user.username)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                    }.listRowBackground(recvColor)
                        
                }
                .background(bg)
                .scrollContentBackground(.hidden)
            }
            .onAppear {
                usersVM.fetchUsers()
            }
        }.modifier(AppBackground())
    }
}

struct MessageView: View {
    var selectedUser: User
    @ObservedObject var authVM = AuthViewModel()
    @ObservedObject var msgVM = MessageViewModel()
    @State private var newMessage: String = ""
    
    // color codes
    let currColor = Color(red: 0.21, green: 0.34, blue: 0.57) // sender/currentUser color
    let recvColor = Color(red: 0.37, green: 0.35, blue: 0.64) // receiver/selectedUSer color
    let headerTextColor = Color(red: 0.96, green: 0.82, blue: 0.44) // header text color
    let headerColor = Color(red: 0.19, green: 0.16, blue: 0.18) // header background color
    let bg = Color(red: 0.25, green: 0.25, blue: 0.33) // main app background color
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    VStack {
                        /* CHAT LOGS */
                        List(msgVM.messages) { message in // populate list with messages array from messageViewModel
                            if message.senderId == selectedUser.id { // if sender's ID is same as selected user's ID
                                Text("\(selectedUser.username): \(message.text)")
                                // text message is from selected user
                                    .foregroundColor(.white)
                                    .listRowBackground(recvColor)
                            } else { // if the ID's are not the same
                                Text("You: \(message.text)") // text message is from sender
                                    .foregroundColor(.white)
                                    .listRowBackground(currColor)
                            }
                        }.background(bg)
                        .scrollContentBackground(.hidden)
                    }
                        
                    /* TEXT FIELD AND SEND BUTTON */
                    HStack {
                        TextField("Type a message", text: $newMessage) // field for user to input new message
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button { // get current user from AuthViewModel
                            guard let currentUser = authVM.currentUser else { return } // get current user
                            msgVM.sendMessage(content: newMessage, senderId: currentUser.id, receiverId: selectedUser.id) // call sendMessage function from MessageViewModel
                            newMessage = "" // empty the new message string
                        } label: {
                            Text("Send")
                                .padding()
                        }
                        .background(.blue)
                        .cornerRadius(4)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }.background(headerColor)
                .onAppear {
                    // get current user from AuthViewModel
                    guard let currentUser = authVM.currentUser else { return }
                    // call fetchMessages function from MessageViewModel
                    msgVM.fetchMessages(currentUser: User(id: currentUser.id, username: "You", email: currentUser.email, sunSign: currentUser.sunSign), selectedUser: selectedUser)
                }
                .onDisappear {
                    msgVM.stopListening()
                }
            }
            .padding(.bottom, 9)
            .padding(.top, 1)
            .navigationBarTitle(selectedUser.username, displayMode: .inline)
            .background(headerColor)
        }.background(bg)
    }
}
