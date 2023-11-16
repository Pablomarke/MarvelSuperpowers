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
    @Published var MainStatus: Status = .loading
    var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool = false, heros: [HeroeData]? = []){
        if (testing){
            getHerosDesign()
        } else {
            getMiHeros()
        }
    }
    func getMiHeros(){
        URLSession.shared
            .dataTaskPublisher(for: Networking().getSessionHero())
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    //error
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                        print("Error al recibir heroes")
                        self.MainStatus = .error
                case .finished:
                        print("Heroes cargados")
                        self.MainStatus = .loaded
                }
            } receiveValue: { data in
                self.heros = data.data.results
            }
            .store(in: &suscriptors)
    }
    
    //solo nos vale para Live Preview
    func getHerosDesign(){
        let thumbnail1 = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg")
        
        let hero1 = HeroeData(id: 1011334, name: "3-D Man", description: "", thumbnail: thumbnail1, series: MarvelItem(available: 2, collectionURI: "", items: [ApiItems(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", name: "Serie 1")], returned: 2))
        
        self.heros = [hero1, hero1, hero1, hero1]
    }
}

