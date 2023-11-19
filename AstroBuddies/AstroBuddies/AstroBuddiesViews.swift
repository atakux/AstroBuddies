//
//  AstroBuddiesViews.swift
//  AstroBuddies
//
//  Created by ataku x on 10/25/23.
//

import SwiftUI



struct HomeScreen: View {
    var body: some View {
        
        // TODO: do home screen UI. fix the weird bug where it keeps "Home Screen" at the top every where you toggle.
        
        VStack {
            VStack {
                Text("Home Screen")
            }
        }.modifier(AppBackground())
            .frame(width: 300, height: 100)
        
        TabBar()
    }
}



struct TarotReading: View {
    var body: some View {
        // TODO: do tarot screen UI. fix the weird bug where it keeps "Home Screen" at the top every where you toggle.
        
        VStack {
            VStack {
                Text("Tarot Screen")
            }
        }.modifier(AppBackground())
            .frame(width: 300, height: 100)
        
        TabBar()
    }
}

struct Compatibility: View {
    var body: some View {
        // TODO: do compatibility screen UI. fix the weird bug where it keeps "Home Screen" at the top every where you toggle.
        VStack {
            VStack {
                Text("Compatibility Screen")
            }
        }.modifier(AppBackground())
            .frame(width: 300, height: 100)
        
        TabBar()
    }
}

struct Messaging: View {
    var body: some View {
        // TODO: do messaging screen UI. fix the weird bug where it keeps "Home Screen" at the top every where you toggle.
        VStack {
            VStack {
                Text("Messaging Screen")
            }
        }.modifier(AppBackground())
            .frame(width: 300, height: 100)
        
        TabBar()
    }
}
