//
//  ProfileView.swift
//  AstroBuddies
//
//  Created by Ha Yeon SON on 12/14/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    
    //dateFormatter.dateFormat = "YY/MM/dd"
    
    var body: some View {
        
        ScrollView {
            
            Spacer()
            
            // If a user is signed in, they can access to the Settings page
            if let user = viewModel.currentUser {
                
                @State var selectedDateTime: Date = (user.dateOfBirth ?? Date.now)
                
                VStack {
                    
                    // Top bar
                    HStack(alignment: .center) {
                        
                        VStack(alignment: .leading) {
                            
                            HStack {
                                // Back button to navigate back to the HomeView
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(systemName: "arrow.left.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                }
                                
                                Spacer(minLength: 2)
                                
                                // Settings Title
                                Text("Profile")
                                    .font(.title)
                                    .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                    .frame(alignment: .center)
                                    .padding()
                                
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                    }.frame(alignment: .leading)
                    
                    Spacer()
                    
                    VStack{
                        HStack{
                            Text("username")
                                .font(.headline)
                                .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                .frame(alignment: .center)
                            
                            Text(user.username)
                                .font(.title3)
                                .modifier(TextModifier())
                            //Spacer(minLength: 1)
                        }
                        
                        Spacer(minLength: 10)
                        
                        HStack{
                            Text("email")
                                .font(.headline)
                                .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                .frame(alignment: .center)
                            
                            Text(user.email)
                                .font(.title3)
                                .modifier(TextModifier())
                            
                            // Spacer(minLength: 1)
                        }
                        
                        Spacer(minLength: 10)
                        
                        HStack{
                            Text("sunSign")
                                .font(.headline)
                                .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                .frame(alignment: .center)
                            
                            Text(user.sunSign.rawValue)
                                .font(.title3)
                                .modifier(TextModifier())
                            
                        }
                        
                        Spacer(minLength: 10)
                        
                        HStack{
                            Text("place Of Birth")
                                .font(.headline)
                                .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                .frame(alignment: .center)
                            
                            Text(user.placeOfBirth ?? "")
                                .font(.title3)
                                .modifier(TextModifier())
                            
                        }
                        
                        Spacer(minLength: 10)
                        
                        HStack{
                            Text("date      Of Birth")
                                .font(.headline)
                                .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                .frame(alignment: .center)
                            
                            var dateOfBirth: String {
                                let today = user.dateOfBirth ?? Date()
                                let formatter1 = DateFormatter()
                                formatter1.dateStyle = .medium
                                return formatter1.string(from: today)
                            }
                            
                            Text(dateOfBirth)
                                .font(.title3)
                                .modifier(TextModifier())
                            
                        }
                        
                        Spacer(minLength: 10)
                        
                        HStack{
                            
                            Text("time    Of Birth")
                                .font(.headline)
                                .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                .frame(alignment: .center)
                            
                            Text(user.timeOfBirth ?? ":")
                                .font(.title3)
                                .modifier(TextModifier())
                            
                        }
                        
                        Spacer(minLength: 10)
                        
                        
                        Button {
                            // TODO: update the user info
                            print("Update")
                        } label: {
                            Text("Update").modifier(ButtonTextModifier())
                        }.modifier(SettingsButtonModifier())
                    
                    }
                }
                
            
                
            }
            
            
            }.modifier(AppBackground())
            
        
    }
}
