//
//  FavoritesHeroesRowView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 11/11/22.
//

import SwiftUI

struct FavoritesHeroesRowView: View {
    var hero: Hero
    
    var body: some View {
        HStack{
            //Imagen
            AsyncImage(url: URL(string: hero.photo)) { photoDownloaded in
                photoDownloaded
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding()
            } placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding()
            }
            //Text
            Spacer()
            Text(hero.name)
                .font(.title2)
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct FavoritesHeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesHeroesRowView(hero: Hero(
            id: UUID(),
            name: "Goku",
            description: "Sobran las presentaciones cuando se habla de Goku.",
            photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300",
            favorite: true))
    }
}
