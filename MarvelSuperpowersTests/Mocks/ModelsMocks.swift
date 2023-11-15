//
//  ModelsMocks.swift
//  MarvelSuperpowersTests
//
//  Created by Pablo Márquez Marín on 15/11/23.
//

import Foundation
@testable import MarvelSuperpowers

// MARK: - Modelos para Mock -
class ModelsMocks {
    let serie = SingleSerieData(id: 123, title: "Los vengadores", description: "Qué guay", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"))
    
    let thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg")
    
    let hero = HeroeData(id: 1011334, name: "3-D Man", description: "No description", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"), series: MarvelItem(available: 2, collectionURI: "", items: [ApiItems(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", name: "Serie 1")], returned: 2))
}
