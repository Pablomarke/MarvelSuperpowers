//
//  MarvelSuperpowersNetworkTest.swift
//  MarvelSuperpowersTests
//
//  Created by Pablo Márquez Marín on 14/11/23.
//

import XCTest
@testable import MarvelSuperpowers

import XCTest

class NetworkingTests: XCTestCase {
    let networking = Networking()
    let networkingMock = NetworkingMock()
    
    func testGetSessionHero() {
        let request = networkingMock.getSessionHero()
        
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertNotNil(request.url)
    }
    
    func testGetSessionSerie() {
        let id = 123
        let request = networkingMock.getSessionSerie(id: id)
        
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertNotNil(request.url)
    }
}






