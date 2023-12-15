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
        NavigationStack {
            ScrollView{
                if let heros = viewModel.heroes{
                    ForEach(heros){ data in
                        NavigationLink {
                            //destino a detalle
                            DetailView(viewModel: DetailViewModel( hero: data))
                        } label : {
                            HeroRowView(hero: data)
                                .frame(height: 224)
                        }
                    }
                }
            }
            .navigationBarTitle("Heroes and villains").tint(Color.clear)
            .padding()
            .ignoresSafeArea(edges: .bottom)
            .background(Image("redwall")
                .resizable()
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    HeroesSubView(viewModel: MainViewModel(testing: true))
}
