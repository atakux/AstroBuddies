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
        }
        
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


struct HeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 80, alignment: .leading)
            .font(.custom("Inter", size: 28).weight(.bold))
            .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 80)
            .font(.custom("Inter", size: 16).weight(.bold))
            .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
    }
}


// Textbox and texbox label modifiers
struct TextBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width - 120, height: 60)
            .background(Color(red: 0.73, green: 0.74, blue: 0.83))
            .cornerRadius(9)
    }
}

struct TextBoxLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width - 140, height: 50)
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


