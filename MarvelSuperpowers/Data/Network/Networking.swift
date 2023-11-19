//
//  Networking.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import Foundation

final class Networking: NetworkingProtocol {

    // MARK: - Public properties -
    let marvelServer = "https://gateway.marvel.com"
    let hash = "" ///Introduce tu Hash
    
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



