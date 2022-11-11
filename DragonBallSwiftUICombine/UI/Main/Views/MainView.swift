//
//  MainView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 5/11/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
           HeroesView(viewModel: HeroesViewModel())
            .tabItem {
                Image(systemName: "figure.kickboxing")
                Text("Heroes")
            }
            DevelopersView(viewModel: DevelopersViewModel())
             .tabItem {
                 Image(systemName: "lock.open.desktopcomputer")
                 Text("Developers")
             }
        }
//        .accentColor(.orange) < iOS16
        .tint(.orange)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
