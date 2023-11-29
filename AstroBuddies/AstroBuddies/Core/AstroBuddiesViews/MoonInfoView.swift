//
//  MoonInfoView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/25/23.
//

import SwiftUI

struct MoonInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
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
                        
                        // Moon Info Title
                        Text("Moon in Lorem")
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
                
            // TODO: integrate a moon data API to replace the placeholder text
            ScrollView(.vertical) {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                    .font(Font.custom("Inter", size: 20))
                    .foregroundColor(Color(red: 0.79, green: 0.73, blue: 0.83))
                    .padding()
                
            }.padding()
            
            
        }.modifier(AppBackground())
            
    }
}

