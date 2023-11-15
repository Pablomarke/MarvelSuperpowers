//
//  Networking.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import Foundation

final class Networking: NetworkingProtocol {
    
    struct HTTPMethods {
        static let post = "POST"
        static let get = "GET"
        static let put = "PUT"
        static let delete = "DELETE"
        
    }
    
    // MARK: - Public properties -
    let marvelServer = "https://gateway.marvel.com"
    let hash = HASH_KEY
    
    private enum endpoint {
        static let allCharacters = "/v1/public/characters"
        static let series = "series"
    }
    
    // MARK: Errores
    enum NetworkError: Error {
        case unknown
        case malformedUrl
        case loginString
        case encodingfailed
        case decodingFailed
        case noData
        case statusCode(code: Int?)
        case noToken
        case httpError
    }
    
    // MARK: - Functions -
    func getSessionHero() -> URLRequest {
        let urlHeroes = "\(marvelServer)\(endpoint.allCharacters)\(hash)"
        
        var request = URLRequest(url: URL(string: urlHeroes)!)
        request.httpMethod = HTTPMethods.get
        return request
    }
    
    func getSessionSerie(id: Int) -> URLRequest {
        let urlSeries = "\(marvelServer)\(endpoint.allCharacters)/\(id)/\(endpoint.series)\(hash)"
        
        var request = URLRequest(url: URL(string: urlSeries)!)
        request.httpMethod = HTTPMethods.get
        return request
    }
}



