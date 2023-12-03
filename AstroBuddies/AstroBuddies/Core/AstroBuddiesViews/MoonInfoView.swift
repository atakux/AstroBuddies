//
//  MoonInfoView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/25/23.
//

import SwiftUI

struct MoonInfoView: View {
    @ObservedObject var todaysMoonModel = GetMoonInfo()

    
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
                        Text("Moon Phase: \(todaysMoonModel.todayMoonPhase)")
                            .font(.title)
                            .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                            .frame(alignment: .center)
                            .padding()
                            .onAppear {
                                todaysMoonModel.fetchMoonPhaseData()
                            }
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
            }.frame(alignment: .leading)
                
            // TODO: integrate a moon data API to replace the placeholder text
            ScrollView(.vertical) {
                Text("hi")
                
            }.padding()
            
            
        }.modifier(AppBackground())
            
    }
}

