//
//  CompatibilityViewModel.swift
//  AstroBuddies
//
//  Created by ataku x on 12/5/23.
//

import Foundation

class CompatibilityViewModel: ObservableObject {
    @Published var compatibilityData: [CompatibilityModel] = []
    
    func fetchCompatibility(sign1: String, sign2: String) {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let configDict = NSDictionary(contentsOfFile: path),
              let APIKey = configDict["APIKey"] as? String,
              let APIHost = configDict["APIHost"] as? String else {
            print("Error reading Config.plist or missing keys.")
            return
        }
        
        // Replace the API key and host with your actual values
        let apiKey = APIKey
        let host = APIHost
        
        let url = URL(string: "https://horoscope-astrology.p.rapidapi.com/affinity?sign1=\(sign1)&sign2=\(sign2)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
        request.addValue(host, forHTTPHeaderField: "X-RapidAPI-Host")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching compatibility data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([CompatibilityModel].self, from: data)
                DispatchQueue.main.async {
                    self.compatibilityData = decodedData
                }
            } catch {
                print("Error decoding compatibility data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct CompatibilityModel: Codable {
    let header: String
    let text: String
}

