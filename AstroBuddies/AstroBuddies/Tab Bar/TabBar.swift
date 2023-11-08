//
//  TabBar.swift
//  AstroBuddies
//
//  Created by ataku x on 10/26/23.
//

import SwiftUI


struct TabBar: View {
    var body: some View {
        TabView {
            
            NavigationView {
                HomeScreen()
            }
            .tabItem {
                Image("home-icon")
            }
            
            NavigationView {
                TarotReading()
            }
            .tabItem {
                    Image("tarot-icon")
            }
            
            NavigationView {
                Compatibility()
            }
            .tabItem {
                Image("compatibility-icon")
            }
            
            NavigationView {
                Messaging()
            }
            .tabItem {
                Image("message-icon")
            }

        }.navigationBarBackButtonHidden(true)
        Spacer(minLength: 2)
        
    }
}
