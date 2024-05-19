//
//  HeroesSubView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 15/12/23.
//

import SwiftUI

struct HeroesSubView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    if let heros = viewModel.heroes{
                        ForEach(heros) { data in
                            NavigationLink {
                                DetailView(viewModel: DetailViewModel( hero: data))
                            } label : {
                                HeroRowView(hero: data)
                            }
                        }
                    }
                }
                .padding()
                .ignoresSafeArea(edges: .bottom)
                .background(Image("redwall")
                    .opacity(0.6)
                    .edgesIgnoringSafeArea(.all))
                .navigationBarTitle("Heroes and villains")
            }
        }
    }
}


#Preview {
    HeroesSubView(viewModel: MainViewModel(testing: true))
}
