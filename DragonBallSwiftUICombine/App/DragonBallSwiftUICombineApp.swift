//
//  DragonBallSwiftUICombineApp.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 1/11/22.
//

import SwiftUI

@main
struct DragonBallSwiftUICombineApp: App {
//    let persistenceController = PersistenceController.shared
    @StateObject var rootViewModel = RootViewModel()

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(rootViewModel)
                //Use CoreData inside the app
//                .environment(\.managedObjectContext, persistenceController.container.viewContext) //It is needt it to use CoreData
        }
    }
}
