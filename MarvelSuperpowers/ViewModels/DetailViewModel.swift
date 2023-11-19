//
//  DetailViewModel.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 10/11/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    // MARK: - Properties -
    @Published var hero: HeroeData?
    @Published var series: [SingleSerieData]?
    @Published var detailStatus: Status = .loading
    var suscriptors = Set<AnyCancellable>()
    
    // MARK: - init -
    init(testing: Bool = false, hero: HeroeData?, series: [SingleSerieData]? = []) {
        if (testing){
            getFakeHeroandSeriesForDesignAndtesting()
            self.detailStatus = .loaded
        } else {
            if let myId = hero?.id {
                getHeroSeries(id: myId)
            }
        }
        // MARK: - Functions -
        func getHeroSeries(id: Int){
            URLSession.shared
                .dataTaskPublisher(for: Networking().getSessionSerie(id: id ))
                .tryMap{
                    guard let response = $0.response as? HTTPURLResponse,
                          response.statusCode == 200 else {
                        //error
                        self.detailStatus = .error
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
}
