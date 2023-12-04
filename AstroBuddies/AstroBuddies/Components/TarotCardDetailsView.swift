//
//  TarotCardDetailsView.swift
//  AstroBuddies
//
//  Created by ataku x on 12/3/23.
//

import SwiftUI

struct TarotCardDetailsView: View {
    @Environment(\.presentationMode) var presentationMode

    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    let card: TarotCard
    
    var body: some View {
        // Changing disks to pentacles and clubs to wands to match how it is properly called.
        let cardname = card.name
        let cardNamedp = cardname.replacingOccurrences(of: "Disks", with: "Pentacles")
        let cardName = cardNamedp.replacingOccurrences(of: "Clubs", with: "Wands")
        
        VStack {
            
            // Top bar
            HStack(alignment: .center) {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        // Back button to navigate back to the TarotView
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.headline)
                                .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                        }
                        
                        Spacer(minLength: 2)
                        
                        // Card Name
                        Text(cardName)
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
            
            // Details for the selected tarot card
            ScrollView(.vertical) {
                
                VStack {
                    Image(card.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 230)
                        .padding(.horizontal)
                    
                    Text("Description: ")
                        .modifier(TitleModifier())
                        .padding()
                        .padding(.bottom)
                    
                    Text(card.description)
                        .font(Font.custom("Inter", size: 20))
                        .foregroundColor(Color(red: 0.79, green: 0.73, blue: 0.83))
                        .padding()
                    
                    
                }
                Spacer()
            }
            .background(
                LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(22)
        }
        .modifier(AppBackground())
        .navigationBarTitle(card.name, displayMode: .inline)
    }
}
