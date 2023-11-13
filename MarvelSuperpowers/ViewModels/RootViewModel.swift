//
//  RootViewModel.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 9/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var status = Status.loading(isLoading: true)
    @Published var firstHeros: [HeroeData]?
    
    var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool = false, heros: [HeroeData]? = []){
        if (testing){
           // getHerosTesting()
        } else {
            print(status)
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
                    self.status = .error(error: "Error buscando heroes")
                case .finished:
                        self.status = .loading(isLoading: false)
                }
            } receiveValue: { data in
                print("Heroes cargados")
                self.firstHeros = data.data.results
            }
            .store(in: &suscriptors)
    }
}
