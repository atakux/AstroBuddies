//
//  ZodiacInfoViewModel.swift
//  AstroBuddies
//
//  Created by ataku x on 11/30/23.
//

import Foundation


class ZodiacInfoViewModel: ObservableObject {
/*
  Class that connects to Horoscope Astrology API from RapidAPI to retrieve zodiac information based on a user's sun sign
 */
    
    @Published var zodiacInfoText = "Loading..."

    func fetchZodiacInfo(sign: String) {
        let headers = [
            "X-RapidAPI-Key": "dfa2158044msh6359d946b81ab6ap188d9ejsn419a4d091251",
            "X-RapidAPI-Host": "horoscope-astrology.p.rapidapi.com"
        ]

        let url = URL(string: "https://horoscope-astrology.p.rapidapi.com/sign?s=\(sign)")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching zodiac sign info: \(error)")
                return
            }

            if let data = data {
                let jsonString = String(data: data, encoding: .utf8)
                
                // debug
                // print("Received JSON: \(jsonString ?? "Invalid JSON")")

                do {
                    let zodiacInfo = try JSONDecoder().decode(ZodiacInfoResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.zodiacInfoText = zodiacInfo.description
                    }
                } catch {
                    print("Error decoding zodiac sign info: \(error)")
                }
            }
        }.resume()
    }
}

struct ZodiacInfoResponse: Codable {
    let description: String

    private enum CodingKeys: String, CodingKey {
        case description = "about"
    }
}

