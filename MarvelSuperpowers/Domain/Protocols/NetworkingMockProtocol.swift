//
//  NetworkingMockProtocol.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 15/11/23.
//

import Foundation

protocol NetworkingMockProtocol: NetworkingProtocol {
    func setMockResponse(data: Data?, response: URLResponse?, error: Error?)
}
