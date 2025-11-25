//
//  ModelsUser.swift
//  SproutFlux App_Rajani_Final Project_V1
//
//  Created by user286658 on 11/5/25.
//

import Foundation
struct User: Codable, Identifiable {
    let id: String
    var name: String
    var email: String
}
//Codable for persistence
//Identifiable for use in lists. confirming to Identifiable protocol. uniquely identified
