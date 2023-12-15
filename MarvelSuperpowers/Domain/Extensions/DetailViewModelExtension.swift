//
//  DetailViewModelExtension.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 17/11/23.
//

import Foundation

extension DetailViewModel {
    //Only for Live Preview
    func getFakeHeroandSeriesForDesignAndtesting() {
        self.hero = HeroeData(id: 1011334, name: "3-D Man", description: "Este es el heroe mas feo que habia, pero lo escogí por ser el primero", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"), series: MarvelItem(available: 2, collectionURI: "", items: [ApiItem(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", name: "Serie 1")], returned: 2))
        let serie1 = SingleSerieData(id: 123, title: "Los vengadores", description: "Qué guay", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"))
        self.series = [serie1, serie1, serie1]
    }
}
