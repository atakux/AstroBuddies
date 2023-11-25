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
    @State private var isHoroscopeViewActive = false
    @State private var isMoonInfoViewActive = false
    
    // top edge value
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    
    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    var body: some View {
        VStack {
            if let user = viewModel.currentUser {
                NavigationView {
                   
                    VStack {
                        
                        // top bar
                        HStack(spacing: 12) {
                            
                            VStack(spacing: 2){
                                Text(user.username)
                                    .fontWeight(.bold)
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
                            
                            // Container holding Horoscope details
                            VStack {
                                ZStack {
                                    
                                    // Horoscope title
                                    HStack {
                                        Text("Your Horoscope")
                                            .fontWeight(.bold)
                                            .modifier(TitleModifier())
                                            .frame(alignment: .leading)
                                            .padding(.horizontal)
                                        
                                    }.padding(.top, 20)
                                    
                                    Spacer()
                                    
                                    // Horoscope details
                                    // TODO: replace placeholder text below with an astrology API text
                                    VStack {
                                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                                            .modifier(ContentTextModifier())
                                            .frame(alignment: .leading)
                                            .padding()
                                    }.padding(.top, 60)
                                        .padding(.bottom, 20)
                                    
                                    Spacer()
                                    // Read More button to lead to horoscope screen in case there is more to read
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        HStack {
                                            Button {
                                                isHoroscopeViewActive.toggle()
                                            } label: {
                                                Text("Read More...")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                                                    .frame(alignment: .leading)
                                            }
                                            .sheet(isPresented: $isHoroscopeViewActive) {
                                                HoroscopeView()
                                                    .interactiveDismissDisabled()
                                            }
                                            .padding(.horizontal)
                                            .frame(alignment: .leading)
                                            Spacer()
                                        }
                                        .padding(.bottom, 20)
                                    }
                                }
                            }
                              .frame(width: 354, height: 312)
                              .background(
                                LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                              )
                              .cornerRadius(22)
                            
                            
                            
                            
                            // Container holding Moon details
                            VStack {
                                ZStack {
                                    
                                    // TODO: change Lorem to the actual zodiac that the moon is in currently
                                    // Moon in Lorem title
                                    HStack {
                                        Text("Moon in Lorem")
                                            .fontWeight(.bold)
                                            .modifier(TitleModifier())
                                            .frame(alignment: .leading)
                                            .padding(.horizontal)
                                        
                                    }.padding(.top, 20)
                                    
                                    Spacer()
                                    
                                    // Horoscope details
                                    // TODO: replace placeholder text below with an astrology API text
                                    VStack {
                                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                                            .modifier(ContentTextModifier())
                                            .frame(alignment: .leading)
                                            .padding()
                                    }.padding(.top, 60)
                                        .padding(.bottom, 20)
                                    
                                    Spacer()
                                    // Read More button to lead to moon info screen in case there is more to read
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        HStack {
                                            Button {
                                                isMoonInfoViewActive.toggle()
                                            } label: {
                                                Text("Read More...")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                                                    .frame(alignment: .leading)
                                            }
                                            .sheet(isPresented: $isMoonInfoViewActive) {
                                                MoonInfoView()
                                                    .interactiveDismissDisabled()
                                            }
                                            .padding(.horizontal)
                                            .frame(alignment: .leading)
                                            Spacer()
                                        }
                                        .padding(.bottom, 20)
                                    }
                                }
                            }
                            .frame(width: 354, height: 312)
                              .background(
                                LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                              )
                              .cornerRadius(22)
                              
                            
                            
                            
                            
                            // TODO: add more containers holding other details!
                            
                        }.modifier(AppBackground())
                        
                    }.modifier(AppBackground())
                }.modifier(AppBackground())
            }
        }.modifier(AppBackground())
        
        
    }
}
