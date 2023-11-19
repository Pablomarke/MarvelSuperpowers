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
                List{
                    if let heros = viewModel.heros{
                        ForEach(heros){ data in
                            NavigationLink {
                                //destino a detalle
                                DetailView(viewModel: DetailViewModel( hero: data))
                            } label : {
                                HeroRowView(hero: data)
                                    .frame(height: 224)
                            }
                            .navigationTitle("Heroes and villains")
                            .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}
#Preview {
    MainView(viewModel: MainViewModel(testing: true))
        //.environment(\.locale, .init(identifier: "es"))
       
}

