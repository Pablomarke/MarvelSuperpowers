//
//  RootAppView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 9/11/23.
//

import SwiftUI

struct RootAppView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status{
        case Status.none:
            withAnimation {
                MainView(viewModel: MainViewModel())
            }
        
        case .loading:
            withAnimation {
                LoadView()
            }
            
        case .error(error: let errorString):
            withAnimation {
                LoadView()
                //TODO
                //ErrorView(error: errorString)
                
            }
        case .loaded:
            withAnimation {
                MainView(viewModel: MainViewModel())
            }
        }
    }
}

#Preview {
    RootAppView()
    
}
