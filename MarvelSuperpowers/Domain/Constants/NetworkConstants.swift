//
//  NetworkConstants.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 17/11/23.
//

import Foundation

// MARK: - Http methods -
struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
}

// MARK: - Network Errors -
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
