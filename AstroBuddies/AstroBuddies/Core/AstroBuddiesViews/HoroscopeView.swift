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
                        Text(horoscopeModel.currentHoroscopeText)
                            .font(Font.custom("Inter", size: 20))
                            .foregroundColor(Color(red: 0.79, green: 0.73, blue: 0.83))
                            .padding()
                    }.scrollTargetLayout()
                    
                }
                .scrollTargetBehavior(.viewAligned)
                .padding()
                .onAppear {
                    horoscopeModel.fetchHoroscope(sunSign: user.sunSign ?? .invalid)
                }
                
                
            }.modifier(AppBackground())
        }
    }
}



