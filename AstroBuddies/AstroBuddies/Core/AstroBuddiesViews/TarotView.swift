//
//  TarotView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct TarotView: View {
    @StateObject private var tarotViewModel = TarotViewModel()
    
    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    // Top edge value
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    

    var body: some View {
        // TODO: prevent reload each time user opens, implement a reload button if user wants to re-get their tarot cards
        VStack {
            Spacer()
            
            VStack {
                Spacer()
                
                // Top bar
                VStack {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer(minLength: 2)
                                
                                // Tarot Reading Title
                                Text("Tarot Reading")
                                    .font(.title)
                                    .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                    .frame(alignment: .center)
                                    .padding(.top, top)
                                
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                    }.frame(alignment: .leading)
                }
                
                // Tarot cards
                VStack(alignment: .center, spacing: 10) {

                    HStack(alignment: .top) {
                        ForEach(tarotViewModel.tarotCards) { card in
                            TarotCardView(card: card)
                                .frame(width: 120, height: 160)
                        }
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                
                Spacer()
                
                
                // TODO: get descriptions for tarot cards
                
            }
            .onAppear {
                tarotViewModel.fetchTarotCards()
            }
    
        }
        .modifier(AppBackground())
        
    }
}

struct TarotCardView: View {
    // View for tarot cards & animations
    @State private var isFlipped = true
    let card: TarotCard
    
    var body: some View {
        VStack {
            ZStack {
                // Front of the card
                CardContent(image: card.image)
                    .opacity(isFlipped ? 0 : 1)
                
                // Back of the card
                CardContent(image: "CardBacks")
                    .opacity(isFlipped ? 1 : 0)
            }
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isFlipped.toggle()
                }
            }
        }
        .frame(width: 150, height: 200)
        .cornerRadius(15)
    }
}

struct CardContent: View {
    // Content of the card (front and back)
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 200)
            .cornerRadius(15)
    }
}
