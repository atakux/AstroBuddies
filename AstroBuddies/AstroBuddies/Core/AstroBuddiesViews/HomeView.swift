//
//  HomeView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//

import SwiftUI


struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    // top edge value
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
               
                VStack {
                    
                    // top bar
                    HStack(spacing: 12) {
                        Text(user.username)
                            .modifier(HeaderModifier())
                        
                        Spacer(minLength: 0)
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, top)
                    .toolbar {

                        NavigationLink {
                            SettingsView()
                        } label: {
                            VStack {
                                Image("settings-icon")
                            }
                            .padding()
                        }.padding()
                    }
                    
                    
                    // content on home screen
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            Text("home screen")
                        }
                    }
                    
                }
                .modifier(AppBackground())
            }
        }
        
    }
}
