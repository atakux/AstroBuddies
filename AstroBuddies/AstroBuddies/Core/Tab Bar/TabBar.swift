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
                Text("Home scren")
            }
            .tabItem {
                Image("home-icon")
            }
            
            NavigationView {
                Text("tarot scren")
            }
            .tabItem {
                    Image("tarot-icon")
            }
            
            NavigationView {
                Text("compatibility scren")
            }
            .tabItem {
                Image("compatibility-icon")
            }
            
            NavigationView {
                Text("message scren")
            }
            .tabItem {
                Image("message-icon")
            }

        }.navigationBarBackButtonHidden(true)
        Spacer()
        
    }
}
