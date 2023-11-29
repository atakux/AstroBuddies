//
//  StarSignIconView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/28/23.
//

import SwiftUI

enum starSign: String, CaseIterable, Identifiable {
    case aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn, aquarius, pisces
    
    var id: String {
        return self.rawValue
    }
    
    var symbol: String {
        return self.rawValue
    }
}


struct StarSignIconView: View {
    let sign: starSign
    
    var body: some View {
        VStack {
            Image("\(sign)-icon")
            
        }.frame(width: 100)
    }
}
