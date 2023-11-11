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
        Text("Hero list")
            .bold()        
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
                    }
                }
            }
        }
    }
}


#Preview {
    MainView(viewModel: MainViewModel(testing: true))
        
}

