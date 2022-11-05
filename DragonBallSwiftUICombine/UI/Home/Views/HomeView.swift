//
//  HomeView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 5/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            VStack{
                Text("Heroes List")
            }
            .tabItem {
                Image(systemName: "figure.kickboxing")
                Text("Heroes")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
