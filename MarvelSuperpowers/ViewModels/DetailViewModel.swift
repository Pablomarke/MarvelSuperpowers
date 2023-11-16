//
//  DetailViewModel.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 10/11/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    @Published var hero: HeroeData?
    @Published var series: [SingleSerieData]?
    @Published var detailStatus: Status = .loading
    var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool = false, hero: HeroeData?, series: [SingleSerieData]? = []) {
        if (testing){
             getHeroTesting()
        } else {
            if let myId = hero?.id {
                getHeroSeries(id: myId)
            }
            
            func getHeroSeries(id: Int){
                URLSession.shared
                    .dataTaskPublisher(for: Networking().getSessionSerie(id: id ))
                    .tryMap{
                        guard let response = $0.response as? HTTPURLResponse,
                              response.statusCode == 200 else {
                            //error
                            throw URLError(.badServerResponse)
                        }
                        return $0.data
                    }
                    .decode(type: SerieResponse.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .sink { completion in
                        switch completion{
                            case .failure:
                                print("Error al recibir los capítulos")
                                self.detailStatus = .error
                            case .finished:
                                print("Series cargadas")
                                self.detailStatus = .loaded
                        }
                    } receiveValue: { data in
                        self.series = data.data.results ?? []
                        self.hero = hero
                    }
                    .store(in: &suscriptors)
            }
        }
        func getHeroTesting() {
            self.hero = HeroeData(id: 1011334, name: "3-D Man", description: "Este es el heroe mas feo que habia, pero lo escogí por ser el primero", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"), series: MarvelItem(available: 2, collectionURI: "", items: [ApiItems(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", name: "Serie 1")], returned: 2))
            let serie1 = SingleSerieData(id: 123, title: "Los vengadores", description: "Qué guay", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"))
            self.series = [serie1, serie1, serie1]
        }
    }
}
