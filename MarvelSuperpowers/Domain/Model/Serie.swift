//
//  Serie.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 14/11/23.
//

import Foundation

struct SerieResponse: Decodable {
    let code:Int
    let data: SerieData
    let status: String
    
    enum CodingKeys: String,
                        CodingKey {
        case code
        case data
        case status
    }
}

struct SerieData: Decodable {
    let total: Int
    let count: Int
    let results: [SingleSerieData]?
    
    enum CodingKeys: String,
                        CodingKey {
        case total
        case count
        case results
    }
}

struct SingleSerieData: Decodable, Identifiable {
    
    let id: Int?
    let title: String?
    let description: String?
    let thumbnail: Thumbnail?
  
    
    enum CodingKeys: String,
                        CodingKey {
        case id
        case title
        case description
        case thumbnail
    }
}
