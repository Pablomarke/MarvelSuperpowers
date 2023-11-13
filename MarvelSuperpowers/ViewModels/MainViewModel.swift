//
//  MainViewModel.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    @Published var heros: [HeroeData]?
    @Published var status = Status.loading
    
    var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool = false, heros: [HeroeData]? = []){
        if (testing){
            getHerosTesting()
        } else {
            getMiHeros()
        }
    }
    func getMiHeros(){
        RootViewModel().$firstHeros
            .sink { heroes in
                self.heros = heroes
            }
            .store(in: &suscriptors)
    }
    /*
    //for Testing and UI Development
    func getHerosTesting(){
        self.status = .loading
        self.heros =  getHerosDesign()
        self.status = .loaded
    }*/
    
    
    //solo nos vale para Live Preview
    func getHerosTesting(){
        let thumbnail1 = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg")
        
        let hero1 = HeroeData(id: 1011334, name: "3-D Man", description: "", thumbnail: thumbnail1, series: Series(available: 2, collectionURI: "", items: [ApiItems(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", name: "Serie 1")], returned: 2))
        
        self.heros = [hero1, hero1, hero1, hero1]
    }
}

