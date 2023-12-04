//
//  TarotView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct TarotView: View {
    @StateObject private var tarotViewModel = TarotViewModel()
    @State private var selectedCard: TarotCard? = nil
    @State private var isFlipped = false
    @State private var cardsFlipped = false
    
    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    // Top edge value
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    

    var body: some View {
        // Descriptions from the scroll view only appear when the user flips the cards
        VStack {
            VStack {
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
                                
                                // Button to refresh tarot cards
                                Button {
                                    
                                    cardsFlipped = false
                                    
                                    if !cardsFlipped {
                                        // if the cards are not flipped, ensure that isFlipped is false and we should fetch new cards
                                        isFlipped = false
                                        tarotViewModel.fetchTarotCards() // fetch new cards
                                    }
                                    
                                } label: {
                                    Image(systemName: "arrow.counterclockwise.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                                        .padding(.top, top)
                                }
                            }.padding(.horizontal)
                                .padding(.leading, 10)
                        }
                        .padding(.horizontal)
                    }.frame(alignment: .leading)
                }
                .padding()
                
                // Tarot cards images
                VStack(alignment: .center, spacing: 10) {

                    HStack(alignment: .top) {
                        ForEach(tarotViewModel.tarotCards) { card in
                            TarotCardView(isFlipped: $isFlipped, cardsFlipped: $cardsFlipped, card: card)
                                .frame(width: 120, height: 160)
                        }
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    
                }
                
                // Only appears when user clicks the tarot cards
                
                Divider()

                // Descriptions for tarot cards
                if isFlipped {
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading) {
                            ForEach(tarotViewModel.tarotCards) { card in
                                
                                // Changing disks to pentacles and clubs to wands to match how it is properly called.
                                var cardname = card.name
                                var cardNamedp = cardname.replacingOccurrences(of: "Disks", with: "Pentacles")
                                var cardName = cardNamedp.replacingOccurrences(of: "Clubs", with: "Wands")
                                
                                // TODO: make pages for the Buttons for each card to view description
                                Button {
                                    print("clicked \(cardName)")
                                } label: {
                                    
                                    VStack(alignment: .leading) {
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(cardName)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                                                .frame(alignment: .leading)
                                        }
                                        
                                        HStack(alignment: .center) {
                                            
                                            Image(card.image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 60, height: 80)
                                                .padding(.horizontal)
                                            
                                            VStack {
                                                Text(card.description)
                                                    .modifier(TextModifier())
                                                
                                            }
                                        }
                                        
                                    }
                                    .frame(width: 360)
                                    
                                    
                                    
                                }.padding(.horizontal)
                                
                            }.padding(.horizontal)
                        }
                        .scrollTargetLayout()
                        
                        
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .background(
                        LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(22)
                    .padding(.top)
                }
                
            }
            .onAppear {
                if tarotViewModel.tarotCards.isEmpty {
                    tarotViewModel.fetchTarotCards()
                } else {
                    tarotViewModel.fetchTarotCardsIfNeeded()
                }
            }
    
        }
        .modifier(AppBackground())
        
    }
}

struct TarotCardView: View {
    // View for tarot cards & animations
    
    @Binding var isFlipped: Bool  // Initialize as true to start with card backs
    @Binding var cardsFlipped: Bool
    let card: TarotCard
        
    var body: some View {
        VStack {
            ZStack {
                // Front of the card
                CardContent(image: card.image)
                    .opacity(isFlipped ? 1 : 0)
                
                // Back of the card
                CardContent(image: "CardBacks")
                    .opacity(isFlipped ? 0 : 1)
            }
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .onTapGesture {
                if !cardsFlipped {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        // Check if the card is already flipped, and only toggle if it's not flipped
                        
                        isFlipped.toggle()
                        cardsFlipped = true
                        
                    }
                }
            }
        }
        .frame(width: 150, height: 250)
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
