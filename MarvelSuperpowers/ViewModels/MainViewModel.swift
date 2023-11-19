//
//  MainViewModel.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    // MARK: - Properties -
    @Published var heros: [HeroeData]?
    @Published var MainStatus: Status = .loading
    var suscriptors = Set<AnyCancellable>()
    
    // MARK: - init -
    init(testing: Bool = false, heros: [HeroeData]? = []){
        if (testing){
            getFakeHerosForDesignAndtesting()
            self.MainStatus = .loaded
        } else {
            getMiHeros()
        }
    }
    
    // MARK: - Functions -
    func getMiHeros(){
        URLSession.shared
            .dataTaskPublisher(for: Networking().getSessionHero())
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    //error
                    self.MainStatus = .error
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
}


