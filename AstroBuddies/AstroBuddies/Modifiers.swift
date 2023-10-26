//
//  Modifiers.swift
//  AstroBuddies
//
//  Created by ataku x on 10/25/23.
//

import Foundation
import SwiftUI

struct AppBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 390, height: 844)
            .background(Color(red: 0.27, green: 0.25, blue: 0.33))
    }
}

struct TextBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 80)
            .background(Color(red: 0.73, green: 0.74, blue: 0.83))
            .cornerRadius(9)
            .padding(5)
    }
}

struct TextBoxLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250, height: 80)
            .font(.custom("Inter", size: 30).weight(.medium))
            .padding()
    }
}

struct ButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 134, height: 67)
            .font(.custom("Inter", size: 30).weight(.bold))
            .foregroundColor(Color(red: 0.87, green: 0.91, blue: 1))
            .padding()
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 144, height: 67)
            .background(Color(red: 0.29, green: 0.46, blue: 0.77))
            .cornerRadius(12)
            .padding()
    }
}

struct AstroBuddiesTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter", size: 40).weight(.heavy))
            .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
            .padding()
    }
}
