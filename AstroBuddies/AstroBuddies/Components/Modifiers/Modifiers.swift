//
//  Modifiers.swift
//  AstroBuddies
//
//  Created by ataku x on 10/25/23.
//

import Foundation
import SwiftUI


// App Background Colour
struct AppBackground: ViewModifier {
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color(red: 0.27, green: 0.25, blue: 0.33))
                .ignoresSafeArea()
        }.ignoresSafeArea()
        
    }
}

// All text modifiers

struct AstroBuddiesTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
            .font(.custom("Inter", size: 40).weight(.semibold))
            .padding()
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(width: geometry.size.width/2+160, height: 60, alignment: .leading)
                .font(.custom("Inter", size: 26).weight(.bold))
                .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
        }
    }
}


struct HeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 30, alignment: .leading)
            .font(.custom("Inter", size: 26).weight(.bold))
            .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 40)
            .font(.custom("Inter", size: 16).weight(.bold))
            .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
    }
}


struct ContentTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(width: geometry.size.width/2+160, alignment: .leading)
                .font(Font.custom("Inter", size: 18))
                .foregroundColor(Color(red: 0.79, green: 0.73, blue: 0.83))
        }
    }
}

// Textbox and texbox label modifiers
struct TextBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width - 120, height: 60)
            .background(Color(red: 0.73, green: 0.74, blue: 0.83))
            .cornerRadius(9)
            .font(.custom("Inter", size: 24).weight(.medium))
    }
}

struct TextBoxLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width - 140, height: 60)
            .font(.custom("Inter", size: 24).weight(.medium))
    }
}


// Button and button text modifiers

struct ButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width / 2, height: 67)
            .font(.custom("Inter", size: 24).weight(.bold))
            .foregroundColor(Color(red: 0.87, green: 0.91, blue: 1))
            .padding()
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width / 2, height: 67)
            .background(Color(red: 0.29, green: 0.46, blue: 0.77))
            .cornerRadius(12)
            .padding()
    }
}


struct SettingsButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width/2 + 150, height: 70)
            .font(.custom("Inter", size: 20).weight(.bold))
            .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
            .background(Color(red: 0.37, green: 0.35, blue: 0.64))
            .cornerRadius(12)
            .padding()
    }
}

struct SettingsTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter", size: 20).weight(.bold))
            .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
    }
}


// containers
struct BackgroundTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width/2 + 150, height: 100)
            .font(.custom("Inter", size: 24).weight(.bold))
            .foregroundColor(Color(red: 0.87, green: 0.91, blue: 1))
            .background(Color(red: 0.57, green: 0.55, blue: 0.84))
            .cornerRadius(12)
            .padding()
    }
}

