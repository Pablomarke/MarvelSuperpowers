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
    @Published var series: [SerieAData]?
    
    var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool = false, hero: HeroeData?, series: [SerieAData]? = []) {
        if (testing){
            // getHerosTesting()
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
                                //self.status = .error(error: "Error al recibir los capítulos")
                            case .finished:
                                print("Series cargadas")
                                
                        }
                    } receiveValue: { data in
                        self.series = data.data.results ?? []
                        self.hero = hero
                        
                    }
                    .store(in: &suscriptors)
            }
        }
    }
}
