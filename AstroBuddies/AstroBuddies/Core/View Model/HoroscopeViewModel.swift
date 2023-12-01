//
//  HoroscopeViewModel.swift
//  AstroBuddies
//
//  Created by ataku x on 11/30/23.
//

import Foundation
import SwiftUI
import Observation

@Observable
class HoroscopeViewModel {
    
    var isLoading = false
    var currentHoroscopeText: String = ""
    
    
    func getHoroscope(for sunSign: Starsign, for moonSign: Starsign, for risingSign: Starsign) async {
        isLoading = true
        
        // Calling OpenAI with the prompt for the user's horoscope
        let prompt = "give me a horoscope for \(sunSign.rawValue) sun sign, \(moonSign.rawValue) moon sign, and \(risingSign.rawValue) rising sign."
        let chatGPTURL = URL(string: "https://api.openai.com/v1/chat/completions")!
        
        var request = URLRequest(url: chatGPTURL)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer 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", forHTTPHeaderField: "Authorization")

        let message = GPTMessage(role: "user", content: prompt)
        let gptBody = GPTBody(model: "gpt-4-0613", messages: [message], max_tokens: 500, stop: ["&&"])

        do {
            request.httpBody = try JSONEncoder().encode(gptBody)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            print((response as! HTTPURLResponse).statusCode)
        
            let horoscope = try JSONDecoder().decode(GPTResponse.self, from: data)
            
            currentHoroscopeText = horoscope.choices.first?.message.content ?? "something broke"
        } catch {
            print("error: ", error)
        }

    }

}

struct GPTResponse: Decodable {
    let choices: [GPTChoice]
}

struct GPTChoice: Decodable {
    let index: Int
    let message: GPTMessage
}

struct GPTBody: Encodable {
    let model: String
    let messages: [GPTMessage]
    let max_tokens: Int
    let stop: [String]
}

struct GPTMessage: Codable {
    let role: String
    let content: String
}
