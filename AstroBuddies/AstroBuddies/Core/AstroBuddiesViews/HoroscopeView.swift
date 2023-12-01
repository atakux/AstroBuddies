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
    var model = HoroscopeViewModel()
    
    var body: some View {
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
                
            
            
            
            // TODO: integrate a horoscope API to replace the placeholder text
            ScrollView(.vertical) {
                VStack {
                    Text(model.currentHoroscopeText)
                }.scrollTargetLayout()
                
            }
            .scrollTargetBehavior(.viewAligned)
            .padding()
            
            
        }.modifier(AppBackground())
            
    }
}



