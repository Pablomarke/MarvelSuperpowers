//
//  Character.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import Foundation

struct CharacterResponse: Decodable {
    let code:Int
    let data: CharacterData
    let status: String
    
    enum CodingKeys: String,
                        CodingKey {
        case code
        case data
        case status
    }
}



struct CharacterData: Decodable {
    let total: Int
    let count: Int
    let results: [HeroeData]?
    
    enum CodingKeys: String,
                        CodingKey {
        case total
        case count
        case results
    }
}

struct HeroeData: Decodable, Identifiable {
    
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
    let series: MarvelItem?
   
    
    enum CodingKeys: String,
                        CodingKey {
        case id
        case name
        case description
        case thumbnail
        case series
    }
}
