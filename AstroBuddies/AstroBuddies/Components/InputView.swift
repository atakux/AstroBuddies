//
//  InputView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String

    let placeholder: String
    
    var isSecureField = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .modifier(TextBox())
                    .modifier(TextBoxLabel())
                
            } else {
                TextField(placeholder, text: $text)
                    .modifier(TextBox())
                    .modifier(TextBoxLabel())
            }
            
            
        }
    }
}
