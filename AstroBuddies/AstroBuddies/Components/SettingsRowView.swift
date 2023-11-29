//
//  SettingsRowView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct SettingsRowView: View {
    
    let imageName: String
    let title: String
    let tintColour: Color
    
    var body: some View {
        
        // Set up buttons to be in SettingsViews
        
        HStack(spacing: 24) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColour)
            
            Spacer()
            
            Text(title)
                .fontWeight(.heavy)
                .modifier(SettingsTextModifier())
            
        }.padding()
    }
}

