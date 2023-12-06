//
//  Message.swift
//  AstroBuddies
//
//  Created by tvirata on 12/5/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id = UUID()
    let user: String
    let text: String
    
}
