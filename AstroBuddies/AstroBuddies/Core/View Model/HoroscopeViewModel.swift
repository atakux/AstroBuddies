//
//  HoroscopeViewModel.swift
//  AstroBuddies
//
//  Created by ataku x on 11/30/23.
//
//  API Used: https://rapidapi.com/Alejandro99aru/api/horoscope-astrology/
//

import Foundation
import SwiftUI

class HoroscopeViewModel: ObservableObject {
/*
  Class that connects to Horoscope Astrology API from RapidAPI to retrieve horoscope information based on a user's sun sign
 */
    
    @Published var currentHoroscopeText = "Loading..."

    func fetchHoroscope(sunSign: Starsign) {
        let headers = [
            "X-RapidAPI-Key": "dfa2158044msh6359d946b81ab6ap188d9ejsn419a4d091251",
            "X-RapidAPI-Host": "horoscope-astrology.p.rapidapi.com"
        ]

        var request = URLRequest(url: URL(string: "https://horoscope-astrology.p.rapidapi.com/horoscope?day=today&sunsign=\(sunSign)")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching horoscope: \(error)")
                return
            }

            if let data = data {
                do {
                    let horoscope = try JSONDecoder().decode(HoroscopeResponse.self, from: data)
                    
                    // debuging
                    // print(horoscope.horoscope)
                    
                    DispatchQueue.main.async {
                        self.currentHoroscopeText = horoscope.horoscope
                    }
                } catch {
                    print("Error decoding horoscope: \(error)")
                }
            }
        }.resume()
    }
}


struct HoroscopeResponse: Codable {
    let horoscope: String
}

