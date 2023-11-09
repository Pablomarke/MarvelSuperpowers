//
//  MarvelSuperpowersApp.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import SwiftUI

@main
struct MarvelSuperpowersApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            RootAppView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(rootViewModel)
        }
    }
}
