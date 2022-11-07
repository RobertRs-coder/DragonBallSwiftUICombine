//
//  HeroesView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 6/11/22.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel: HeroesViewModel
    @State private var filter: String = ""
    
    var body: some View {
        NavigationView{
            List{
                if let heroes = viewModel.heroes{
                    ForEach(heroes) { hero in
                        NavigationLink {
                            Text(hero.name)
                        } label: {
                            //DetailView
                            HeroesRowView(hero: hero)
                        }
                    }
                }
            }
            .searchable(text: $filter, prompt: "Search hero")
            .onChange(of: filter, perform: { newValue in
                viewModel.getHeroes(filter: newValue)
            })
            .onDisappear{
                //Call some method

            }
            .onAppear{
                //Call some method
            }
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: HeroesViewModel(testing: true))
    }
}
