//
//  MainView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        if viewModel.MainStatus == .error {
            ErrorView()
        } else if viewModel.MainStatus == .loading {
            LaunchView()
        } else if viewModel.MainStatus == .loaded {
            NavigationStack {
                ScrollView{
                    if let heros = viewModel.heros{
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
                .navigationTitle("Heroes and villains")
                .padding()
                .ignoresSafeArea(edges: .bottom)
                    .background(Image("redwall")
                        .resizable()
                        .opacity(0.8)
                       .edgesIgnoringSafeArea(.all)
                    )
                    
            }
            
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel(testing: true))
        //.environment(\.locale, .init(identifier: "es"))
       
}

