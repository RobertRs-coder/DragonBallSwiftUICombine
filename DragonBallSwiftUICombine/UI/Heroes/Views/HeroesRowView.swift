//
//  HeroesRowView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 7/11/22.
//

import SwiftUI

struct HeroesRowView: View {
    var hero: Hero
    
    var body: some View {
        VStack{
            
            AsyncImage(url: URL(string: hero.photo)) { photoDownloaded in
                photoDownloaded
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
            }
            Text(hero.name)
                .font(.title2)
                .padding([.top, .leading], 10)
           
            if hero.favorite ?? false {
                Image(systemName: "heart.circle")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 40, height: 40)
//                    .offset(x: 10, y:: 10) //UX Godness level
            } else {
                Image(systemName: "heart.circle")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 40, height: 40)
            }
        }
    }
}

struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(hero: Hero(
            id: UUID(),
            name: "Goku",
            description: "Sobran las presentaciones cuando se habla de Goku.",
            photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300",
            favorite: true
        ))
        .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/330.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/))
    }
}
