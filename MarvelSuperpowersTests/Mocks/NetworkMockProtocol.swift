//
//  NetworkMockProtocol.swift
//  MarvelSuperpowersTests
//
//  Created by Pablo Márquez Marín on 15/11/23.
//

import Foundation
@testable import MarvelSuperpowers

// MARK: - Clase para hacer un networking mock -

class NetworkingMock: NetworkingMockProtocol {
    private var mockData: Data?
    private var mockResponse: URLResponse?
    private var mockError: Error?

    func setMockResponse(data: Data?, response: URLResponse?, error: Error?) {
        mockData = data
        mockResponse = response
        mockError = error
    }
    
// MARK: - Funciones que devuelven una URLRequest falsa -
    func getSessionHero() -> URLRequest {
        let urlHeroes = URLRequest(url: URL(string: "http://example.com/mock")!)
        return urlHeroes
    }

    func getSessionSerie(id: Int) -> URLRequest {
        let urlSeries = URLRequest(url: URL(string: "http://example.com/mock/\(id)/series")!)
        return urlSeries
    }
}
