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

        }.navigationBarBackButtonHidden(true)
            .modifier(AppBackground())

        
    }
}
