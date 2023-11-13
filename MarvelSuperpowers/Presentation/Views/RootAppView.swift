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
                
            case .error(error: _):
                withAnimation {
                    ErrorView()
                }
                
            case .loading(isLoading: let isLoading):
                if isLoading {
                    LoadView()
                } else {
                    MainView(viewModel: MainViewModel())
                }
        }
    }
}

#Preview {
    RootAppView()
        .environmentObject(RootViewModel())
}
