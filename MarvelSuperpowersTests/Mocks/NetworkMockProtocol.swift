//
//  NetworkMockProtocol.swift
//  MarvelSuperpowersTests
//
//  Created by Pablo Márquez Marín on 15/11/23.
//

import Foundation
@testable import MarvelSuperpowers

// MARK: - Class for networking mock -
class NetworkingMock: NetworkingMockProtocol {
    private var mockData: Data?
    private var mockResponse: URLResponse?
    private var mockError: Error?

    func setMockResponse(data: Data?, response: URLResponse?, error: Error?) {
        mockData = data
        mockResponse = response
        mockError = error
    }
    
// MARK: - Functions for false request -
    func getSessionHero() -> URLRequest {
        let urlHeroes = URLRequest(url: URL(string: "http://MarvelApiexample.com/mock")!)
        return urlHeroes
    }

    func getSessionSerie(id: Int) -> URLRequest {
        let urlSeries = URLRequest(url: URL(string: "http://MarvelApiexample.com/mock/\(id)/series")!)
        return urlSeries
    }
}
