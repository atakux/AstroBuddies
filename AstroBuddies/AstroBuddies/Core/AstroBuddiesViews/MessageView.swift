//
//  MessageView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct MessageView: View {
    
    // Gradient for the background
    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    // Top edge value
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    VStack {
                        Conversation()
                    }.padding(.horizontal)
                }.frame(alignment: .leading)
            }.padding()
            
//            VStack {
//                // Top bar
//                VStack {
//                    HStack(alignment: .center) {
//                        VStack(alignment: .leading) {
//                            HStack {
//                                Spacer(minLength: 2)
//                                // Message Title
//                                Text("Message")
//                                    .font(.title)
//                                    .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
//                                    .frame(alignment: .center)
//                                    .padding(.top, top)
//                                
//                                Spacer()
//                                
//                            }.padding(.horizontal)
//                                .padding(.leading, 10)
//                        }
//                        .padding(.horizontal)
//                    }.frame(alignment: .leading)
//                }
//                .padding()
//            }
            
            
        }.modifier(AppBackground())
    }
}

struct Conversation: View {
    @State var message = ""
    @ObservedObject var viewModel = MessageViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages) {
                    msg in
                    HStack{
                        HStack {
                            Text("\(msg.user): \(msg.text)")
                                .foregroundColor(.white)
                        } .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }.padding(.horizontal)
                        .padding(.top, 8)
                }
            }
            HStack {
                TextField("Enter message: ", text: $message)
                Button("Send") {
                    sendMessage()
                }
            }
        }
    }
    func sendMessage() {
        guard !message.isEmpty else {return}
        viewModel.sendMessage(content: message)
        message = ""
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
