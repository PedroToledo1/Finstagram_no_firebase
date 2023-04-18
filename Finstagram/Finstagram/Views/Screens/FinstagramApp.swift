//
//  FinstagramApp.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 12/4/23.
//

import SwiftUI

@main
struct FinstagramApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}



