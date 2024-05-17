//
//  MainViewModelExtension.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 17/11/23.
//

import Foundation

extension MainViewModel {
    //Only for Live Preview
    func getFakeHerosForDesignAndtesting(){
        let thumbnail1 = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                                   extension2: "jpg")
        let hero1 = HeroeData(id: 1011334, 
                              name: "3-D Man",
                              description: "",
                              thumbnail: thumbnail1,
                              series: MarvelItem(available: 2,
                                                 collectionURI: "",
                                                 items: [ApiItem(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                                                                 name: "Serie 1")],
                                                 returned: 2))
        
        self.heroes = [hero1, hero1, hero1, hero1]
    }
}
