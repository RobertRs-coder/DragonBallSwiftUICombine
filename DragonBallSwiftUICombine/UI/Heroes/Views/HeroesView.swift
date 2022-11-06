//
//  HeroesView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 6/11/22.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel: HeroesViewModel
    var body: some View {
        NavigationView{
            List{
                if let heroes = viewModel.heroes{
                    ForEach(heroes) { hero in
                        Text(hero.name)
                    }
                }
            }
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: HeroesViewModel(testing: true))
    }
}
