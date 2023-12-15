//
//  TabBar.swift
//  AstroBuddies
//
//  Created by ataku x on 10/26/23.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, tarot, compatibility, message
    }
    

    var body: some View {
        TabView(selection: $selectedTab) {
            
            // Tab icon for HomeView
            // if selected, changes colour
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Image(selectedTab == .home ? "home-icon-fill" : "home-icon")
                }
            
            
            // Tab icon for TarotView
            // if selected, changes colour
            TarotView()
                .tag(Tab.tarot)
                .tabItem {
                    Spacer()
                    Image(selectedTab == .tarot ? "tarot-icon-fill" : "tarot-icon").padding()
                }
            
            
            // Tab icon for CompatibilityView
            // if selected, changes colour
            CompatibilityView()
                .tag(Tab.compatibility)
                .tabItem {
                    Image(selectedTab == .compatibility ? "compatibility-icon-fill" : "compatibility-icon")
                }
            
            
            // Tab icon for MessageView
            // if selected, changes colour
            //MessageView()
            ShowUsersView()
                .tag(Tab.message)
                .tabItem {
                    Image(selectedTab == .message ? "message-icon-fill" : "message-icon")
                }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(Color(red: 0.19, green: 0.16, blue: 0.18))
            UITabBar.appearance().backgroundColor = UIColor(Color(red: 0.19, green: 0.16, blue: 0.18))
        
                }
        .accentColor(.white) // Set the selected tab item color
    }
}
