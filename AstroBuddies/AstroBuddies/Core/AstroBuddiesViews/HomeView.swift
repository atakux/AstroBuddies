//
//  HomeView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//

import SwiftUI


struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isSettingsViewActive = false
    
    // top edge value
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
               
                VStack {
                    
                    // top bar
                    HStack(spacing: 12) {
                        
                        VStack(spacing: 2){
                            Text(user.username)
                                .modifier(HeaderModifier())
                            
                            Text("sun sign moon sign rising sign")
                                .font(.subheadline)
                                .modifier(TextModifier())
                        }.padding()
                        
                        Spacer(minLength: 0)
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, top)
                    .toolbar {
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        Button {
                            isSettingsViewActive.toggle()
                        } label: {
                            Spacer()
                            Image("settings-icon")
                                .padding(.vertical)
                        }
                        .sheet(isPresented: $isSettingsViewActive) {
                            SettingsView()
                                .interactiveDismissDisabled()
                        }
                        
                    }
                    
                    
                    // content on home screen
                    ScrollView {
                        VStack(spacing: 0) {
                            
                            
                            Text("home screen")
                            
                            
                        }
                          .frame(width: 354, height: 312)
                          .background(
                            LinearGradient(gradient: Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)]), startPoint: .top, endPoint: .bottom)
                          )
                          .cornerRadius(22)
                        
                    }.modifier(AppBackground())
                    
                }
                .modifier(AppBackground())
            }.modifier(AppBackground())
        }
        
    }
}
