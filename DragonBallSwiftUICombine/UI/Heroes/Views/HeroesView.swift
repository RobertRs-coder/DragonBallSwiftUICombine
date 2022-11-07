//
//  HeroesView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 6/11/22.
//

import SwiftUI

struct HeroesView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @StateObject var viewModel: HeroesViewModel
    @State private var filter: String = ""
    
    var body: some View {
        //NavigationView <iOS 16
        NavigationStack{
            List{
                if let heroes = viewModel.heroes{
                    ForEach(heroes) { hero in
                        NavigationLink {
                            HeroesDetailView(viewModel: viewModel, hero: hero)
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
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        //Close session
                        rootViewModel.closeSession()
                    } label: {
                        Image(systemName: "xmark.circle")
                        .font(.caption)
                        .foregroundColor(.red)
                        Text("Close session")
                        .font(.caption)
                        .foregroundColor(.red)
                    }
                }
            }
            .onDisappear{
                //Call some method when View disappear
            }
            .onAppear{
                //Call some method when View appear
            }
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: HeroesViewModel(testing: true))
    }
}
