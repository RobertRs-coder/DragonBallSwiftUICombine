//
//  DragonBallSwiftUICombineApp.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 1/11/22.
//

import SwiftUI

@main
struct DragonBallSwiftUICombineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext) //It is needt it to use CoreData
        }
    }
}
