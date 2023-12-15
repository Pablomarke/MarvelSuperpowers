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
        switch viewModel.MainStatus {
            case .error :
                ErrorView()
            case .loading :
                LaunchView()
            case .loaded :
                HeroesSubView(viewModel: viewModel)
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel(testing: true))
    //.environment(\.locale, .init(identifier: "es"))
    
}

