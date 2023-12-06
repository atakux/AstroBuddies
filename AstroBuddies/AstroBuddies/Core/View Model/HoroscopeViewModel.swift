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
    
    @Published var todayHoroscopeText = "Loading..."
    @Published var monthHoroscopeText = "Loading..."

    

    func fetchHoroscope(sunSign: Starsign, time: String) {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let configDict = NSDictionary(contentsOfFile: path),
              let APIKey = configDict["APIKey"] as? String,
              let APIHost = configDict["APIHost"] as? String else {
            print("Error reading Config.plist or missing keys.")
            return
        }
        
        let headers = [
            "X-RapidAPI-Key": APIKey,
            "X-RapidAPI-Host": APIHost
        ]

        var request = URLRequest(url: URL(string: "https://horoscope-astrology.p.rapidapi.com/horoscope?day=\(time)&sunsign=\(sunSign)")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching horoscope: \(error)")
                return
            }
            
            if time == "today" {
                
                if let data = data {
                    do {
                        let horoscope = try JSONDecoder().decode(HoroscopeResponse.self, from: data)
                        
                        // debuging
                        // print(horoscope.horoscope)
                        
                        DispatchQueue.main.async {
                            self.todayHoroscopeText = horoscope.horoscope
                        }
                    } catch {
                        print("Error decoding horoscope: \(error)")
                    }
                }
                
            } else if time == "month" {
                if let data = data {
                    do {
                        let horoscope = try JSONDecoder().decode(HoroscopeResponse.self, from: data)
                        
                        // debuging
                        // print(horoscope.horoscope)
                        
                        DispatchQueue.main.async {
                            self.monthHoroscopeText = horoscope.horoscope
                        }
                    } catch {
                        print("Error decoding horoscope: \(error)")
                    }
                }
            }
            
            
            
        }.resume()
    }
}


struct HoroscopeResponse: Codable {
    let horoscope: String
}

