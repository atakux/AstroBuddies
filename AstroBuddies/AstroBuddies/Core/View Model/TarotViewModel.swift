//
//  TarotViewModel.swift
//  AstroBuddies
//
//  Created by ataku x on 12/3/23.
//
//  API used: https://rapidapi.com/Alejandro99aru/api/horoscope-astrology
//  Images from: https://luciellaes.itch.io/rider-waite-smith-tarot-cards-cc0
//

import Foundation
import SwiftUI
import Combine

class TarotViewModel: ObservableObject {
    @Published var tarotCards: [TarotCard] = []
    
    // Store the last fetch date
    private var lastFetchDate: Date? {
        get { UserDefaults.standard.object(forKey: "LastFetchDate") as? Date }
        set { UserDefaults.standard.set(newValue, forKey: "LastFetchDate") }
    }
    
    init() {
        // Fetch tarot cards when the app is launched
        fetchTarotCardsIfNeeded()
    }
    
    // Function to fetch tarot cards only if a day has passed since the last fetch, so that it doesn't refresh every time app is opened.
    func fetchTarotCardsIfNeeded() {
        guard let lastFetchDate = lastFetchDate else {
            fetchTarotCards()
            return
        }
        
        if !Calendar.current.isDateInToday(lastFetchDate) {
            fetchTarotCards()
        }
    }
    
    func fetchTarotCards() {
        // Fetching tarot cards from the API
        guard let url = URL(string: "https://horoscope-astrology.p.rapidapi.com/threetarotcards") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("dfa2158044msh6359d946b81ab6ap188d9ejsn419a4d091251", forHTTPHeaderField: "X-RapidAPI-Key")
        request.addValue("horoscope-astrology.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching tarot cards: \(error)")
                return
            }
            
            if let data = data {
                do {
                    // create the TarotCards based on what was fetched from the API
                    let decoder = JSONDecoder()
                    let tarotResponse = try decoder.decode(TarotResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.tarotCards = tarotResponse.res.map {
                            TarotCard(name: $0.name, image: "\(removeSpaces(from: $0.name))", description: $0.desc)
                        }
                    }
                } catch {
                    print("Error decoding tarot cards: \(error)")
                }
            }
        }.resume()
        
        lastFetchDate = Date()
    }
}

struct TarotResponse: Decodable {
    let res: [TarotCardResponse]
}

struct TarotCardResponse: Decodable {
    let name: String
    let image: String
    let desc: String
}

struct TarotCard: Identifiable, Equatable, Codable {
    // TarotCard object
    var id = UUID()
    let name: String
    let image: String
    let description: String
    
    static let placeholder = TarotCard(name: "Placeholder", image: "CardBacks", description: "No card available")
}

func removeSpaces(from input: String) -> String {
    // Function to remove the spaces in a string
    let result = input.replacingOccurrences(of: " ", with: "")
    return result
}
