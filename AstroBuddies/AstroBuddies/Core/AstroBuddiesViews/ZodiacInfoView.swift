//
//  ZodiacSignInfo.swift
//  AstroBuddies
//
//  Created by ataku x on 11/30/23.
//
//  API used: https://rapidapi.com/Alejandro99aru/api/horoscope-astrology
//
//

import Foundation
import SwiftUI

struct ZodiacInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    @ObservedObject var zodiacInfoViewModel = ZodiacInfoViewModel()
    
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
                            
                            // Zodiac Title
                            Image("\(user.sunSign.rawValue)-icon")
                            Text("\(user.sunSign.rawValue.capitalized)")
                                .font(.title)
                                .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                .frame(alignment: .center)
                                .padding()
                            Image("\(user.sunSign.rawValue)-icon")

                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                }.frame(alignment: .leading)
                
                
                
                // Integrating a horoscope API to give user their horoscope of the day based on their sun sign
                ScrollView(.vertical) {
                    VStack {
                        Text(zodiacInfoViewModel.zodiacInfoText)
                            .font(Font.custom("Inter", size: 20))
                            .foregroundColor(Color(red: 0.79, green: 0.73, blue: 0.83))
                            .padding()
                            .onAppear {
                                zodiacInfoViewModel.fetchZodiacInfo(sign: user.sunSign.rawValue)
                            }
                    }
                    .scrollTargetLayout()
                    .frame(width: 354)
                    .background(
                        LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(22)
                    
                }
                .scrollTargetBehavior(.viewAligned)
                .padding()
                
                
            }.modifier(AppBackground())
        }
    }
}

