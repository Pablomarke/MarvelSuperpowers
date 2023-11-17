//
//  GeneralApi.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 14/11/23.
//

import Foundation

// MARK: - General api images -
struct Thumbnail: Decodable {
    let path: String
    let extension2: String
    
    enum CodingKeys: String,
                        CodingKey {
        case path
        case extension2  = "extension"
    }
    
    func thumbnailComplete() -> URL? {
    let totalUrl = URL(string: "\(path).\(extension2)")
        return totalUrl
    }
}

// MARK: - Items -
struct MarvelItem: Decodable {
    let available: Int
    let collectionURI: String
    let items: [ApiItems]
    let returned: Int
    
    enum CodingKeys: String,
                     CodingKey {
        case available
        case collectionURI
        case items
        case returned
    }
}

struct ApiItems: Decodable {
    let resourceURI: String
    let name: String
    
    enum CodingKeys: String,
                        CodingKey {
        case resourceURI
        case name
    }
}

