//
//  TabBar.swift
//  AstroBuddies
//
//  Created by ataku x on 10/26/23.
//

import SwiftUI



struct TabBar: View {
    init() {
            // Set the background color of the TabBar using UIKit appearance
            UITabBar.appearance().barTintColor = UIColor(Color(red: 0.19, green: 0.16, blue: 0.18))
        }
    
    var body: some View {

        
        TabView {
            HomeView()
                .tabItem {
                    Image("home-icon")
                }
            
            TarotView()
                .tabItem {
                    Image("tarot-icon")
                }
            
            CompatibilityView()
                .tabItem {
                    Image("compatibility-icon")
                }
            
            MessageView()
                .tabItem {
                    Image("message-icon")
                }
            
        }
        
        
        
    }
}
