//
//  NetworkingProtocol.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 15/11/23.
//

import Foundation

protocol NetworkingProtocol {
    func getSessionHero() -> URLRequest
    func getSessionSerie(id: Int) -> URLRequest
}
