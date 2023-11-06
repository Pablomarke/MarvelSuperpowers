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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
