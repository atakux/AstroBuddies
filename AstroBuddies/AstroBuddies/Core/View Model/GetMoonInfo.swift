//
//  GetMoonInfo.swift
//  AstroBuddies
//
//  Created by ataku x on 12/1/23.
//
//  API used: https://rapidapi.com/MoonAPIcom/api/moon-phase
//

import Foundation


import Foundation

class GetMoonInfo: ObservableObject {
    @Published var todayMoonPhase = ""
    
    func fetchMoonPhaseData() {
        guard let url = URL(string: "https://moon-phase.p.rapidapi.com/advanced?lat=51.4768&lon=-0.0004") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "X-RapidAPI-Key": "dfa2158044msh6359d946b81ab6ap188d9ejsn419a4d091251",
            "X-RapidAPI-Host": "moon-phase.p.rapidapi.com"
        ]

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase // Handle snake_case in JSON
                    let moonData = try decoder.decode(MoonData.self, from: data)

                    DispatchQueue.main.async {
                        self.todayMoonPhase = moonData.moon.phaseName
                    }
                } catch {
                    print("JSON parsing error: \(error)")
                }
            }
        }

        dataTask.resume()
    }
}


struct MoonData: Decodable {
    let moon: Moon
}

struct Moon: Decodable {
    let phaseName: String
}
