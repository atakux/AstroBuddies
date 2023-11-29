//
//  TarotView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct TarotView: View {
    
    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    
    
    var body: some View {
        VStack {
            
            VStack {
                // TODO: insert tarot card "buttons" that can be flipped to reveal the user's tarot reading for the day
                Text("tarot cards")
                
                
                
            }
            Spacer()
            
            HStack(alignment: .bottom) {
                VStack(alignment: .center) {
                    ScrollView(.vertical, showsIndicators: true) {
                        Spacer()
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                            .frame(width: 300, height: 312)
                            .modifier(ContentTextModifier())
                            .frame(alignment: .leading)
                            .padding()
                        
                        Spacer()
                    }
                    .frame(maxHeight: .infinity)
                    .background(
                        LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(22)
                    
                }
                .frame(width: 354, height: 312)
                .modifier(AppBackground())
            }
            
            
        }.modifier(AppBackground())
    }
}

struct TarotView_Previews: PreviewProvider {
    static var previews: some View {
        TarotView()
    }
}
