//
//  Starsign.swift
//  AstroBuddies
//
//  Created by ataku x on 11/30/23.
//

import Foundation

enum Starsign: String, CaseIterable, Identifiable {
    case aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn, aquarius, pisces
    
    var id: Int {
        return Starsign.allCases.firstIndex(of: self)! + 1
    }
    
    var sign: String {
        return self.rawValue
    }
    
    var symbol: String {
        return "\(self.rawValue)-icon"
    }
    
    static func getSunSign(_ date: Date) -> Starsign {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        
        switch (day, month) {
            case (21...31, 3), (1...19, 4):
                return .aries
            case (20...30, 4), (1...20, 5):
                return .taurus
            case (21...31, 5), (1...20, 6):
                return .gemini
            case (21...30, 6), (1...22, 7):
                return .cancer
            case (23...31, 7), (1...22, 8):
                return .leo
            case (23...31, 8), (1...22, 9):
                return .virgo
            case (23...30, 9), (1...22, 10):
                return .libra
            case (23...31, 10), (1...21, 11):
                return .scorpio
            case (22...30, 11), (1...21, 12):
                return .sagittarius
            case (22...31, 12), (1...19, 1):
                return .capricorn
            case (20...31, 1), (1...18, 2):
                return .aquarius
            case (19...29, 2), (1...20, 3):
                return .pisces
            default:
                return .gemini
        }
    }
    
    
    static func getMoonSign(_ date: Date) -> Starsign {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        // TODO: get place of birth
        // TODO: get time of birth
        
        switch (day, month) {
            case (21...31, 3), (1...19, 4):
                return .aries
            case (20...30, 4), (1...20, 5):
                return .taurus
            case (21...31, 5), (1...20, 6):
                return .gemini
            case (21...30, 6), (1...22, 7):
                return .cancer
            case (23...31, 7), (1...22, 8):
                return .leo
            case (23...31, 8), (1...22, 9):
                return .virgo
            case (23...30, 9), (1...22, 10):
                return .libra
            case (23...31, 10), (1...21, 11):
                return .scorpio
            case (22...30, 11), (1...21, 12):
                return .sagittarius
            case (22...31, 12), (1...19, 1):
                return .capricorn
            case (20...31, 1), (1...18, 2):
                return .aquarius
            case (19...29, 2), (1...20, 3):
                return .pisces
            default:
                return .gemini
        }
    }
    
    static func getRisingSign(_ date: Date) -> Starsign {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        switch (day, month) {
            case (21...31, 3), (1...19, 4):
                return .aries
            case (20...30, 4), (1...20, 5):
                return .taurus
            case (21...31, 5), (1...20, 6):
                return .gemini
            case (21...30, 6), (1...22, 7):
                return .cancer
            case (23...31, 7), (1...22, 8):
                return .leo
            case (23...31, 8), (1...22, 9):
                return .virgo
            case (23...30, 9), (1...22, 10):
                return .libra
            case (23...31, 10), (1...21, 11):
                return .scorpio
            case (22...30, 11), (1...21, 12):
                return .sagittarius
            case (22...31, 12), (1...19, 1):
                return .capricorn
            case (20...31, 1), (1...18, 2):
                return .aquarius
            case (19...29, 2), (1...20, 3):
                return .pisces
            default:
                return .gemini
        }
    }
}
