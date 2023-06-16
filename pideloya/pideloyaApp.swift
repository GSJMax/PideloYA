//
//  pideloyaApp.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import SwiftUI

@main
struct pideloyaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
