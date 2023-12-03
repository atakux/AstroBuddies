//
//  HoroscopeView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/25/23.
//

import Foundation
import SwiftUI
import SwiftData

struct HoroscopeView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var horoscopeModel = HoroscopeViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    
    // Gradient value for containers
    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    
    var body: some View {
        if let user = viewModel.currentUser {
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
                            
                            // Your Horoscope Title
                            Text("Your Horoscope")
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
                
                
                
                // Integrating a horoscope API to give user their horoscope of the day based on their sun sign
                ScrollView(.vertical) {
                    VStack {
                        VStack {
                            Text("Today's Horoscope: ")
                                .modifier(TitleModifier())
                                .padding(.bottom)
                            
                            Text(horoscopeModel.todayHoroscopeText)
                                .font(Font.custom("Inter", size: 20))
                                .foregroundColor(Color(red: 0.79, green: 0.73, blue: 0.83))
                                .padding()
                        }
                        .onAppear {
                            horoscopeModel.fetchHoroscope(sunSign: user.sunSign ?? .invalid, time: "today")
                        }
                        .frame(width: 354)
                        .background(
                            LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                        )
                        .cornerRadius(22)
                        
                        VStack {
                            Text("Month's Horoscope: ")
                                .modifier(TitleModifier())
                                .padding(.bottom)
                            
                            Text(horoscopeModel.monthHoroscopeText)
                                .font(Font.custom("Inter", size: 20))
                                .foregroundColor(Color(red: 0.79, green: 0.73, blue: 0.83))
                                .padding()
                            
                        }
                        .onAppear {
                            horoscopeModel.fetchHoroscope(sunSign: user.sunSign ?? .invalid, time: "month")
                        }
                        .frame(width: 354)
                        .background(
                            LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                        )
                        .cornerRadius(22)
                        
                    }.scrollTargetLayout()
                    
                }
                .scrollTargetBehavior(.viewAligned)
                .padding()
                
                
                
            }.modifier(AppBackground())
        }
    }
}



