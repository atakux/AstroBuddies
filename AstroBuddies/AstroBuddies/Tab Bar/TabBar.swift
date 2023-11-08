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
            
            Text("Tarot")
                .tabItem {
                    Image("tarot-icon")
                }
            
            Text("Compatibility")
                .tabItem {
                    Image("compatibility-icon")
                }
            
            Text("Message")
                .tabItem {
                    Image("message-icon")
                }

        }.navigationBarBackButtonHidden(true)
        
    }
}
